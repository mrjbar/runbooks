# List Events
https://github.com/brendangregg/perf-tools
https://brendangregg.com/perf.html

- **perf stat**: obtain event counts
- **perf record**: record events for later reporting
- **perf report**: break down events by process, function, etc.
- **perf annotate**: annotate assembly or source code with event counts
- **perf top**: see live event count
- **perf bench**: run different kernel microbenchmarks

### Listing all currently known events
```
sudo perf list
```

**Output**
```
List of pre-defined events (to be used in -e):

  alignment-faults                                   [Software event]
  bpf-output                                         [Software event]
  context-switches OR cs                             [Software event]
  cpu-clock                                          [Software event]
  cpu-migrations OR migrations                       [Software event]
  dummy                                              [Software event]
  emulation-faults                                   [Software event]
  major-faults                                       [Software event]
  minor-faults                                       [Software event]
  page-faults OR faults                              [Software event]
  task-clock                                         [Software event]

  msr/smi/                                           [Kernel PMU event]
  msr/tsc/                                           [Kernel PMU event]
  power/energy-cores/                                [Kernel PMU event]
  power/energy-gpu/                                  [Kernel PMU event]
  power/energy-pkg/                                  [Kernel PMU event]
  power/energy-ram/                                  [Kernel PMU event]

  rNNN                                               [Raw hardware event descriptor]
  cpu/t1=v1[,t2=v2,t3 ...]/modifier                  [Raw hardware event descriptor]
   (see 'man perf-list' on how to encode it)

  mem:<addr>[/len][:access]                          [Hardware breakpoint]

  alarmtimer:alarmtimer_cancel                       [Tracepoint event]
  alarmtimer:alarmtimer_fired                        [Tracepoint event]
  alarmtimer:alarmtimer_start                        ...
```

### Listing sched tracepoints
```
sudo perf list 'sched:*'
```

**Output**
```
List of pre-defined events (to be used in -e):

  sched:sched_kthread_stop                           [Tracepoint event]
  sched:sched_kthread_stop_ret                       [Tracepoint event]
  sched:sched_migrate_task                           [Tracepoint event]
  sched:sched_move_numa                              [Tracepoint event]
  sched:sched_pi_setprio                             [Tracepoint event]
...
```

### List events with names containing the string 'block'
```
sudo perf list block
```
**Output**
```
  block:block_bio_backmerge                          [Tracepoint event]
  block:block_bio_bounce                             [Tracepoint event]
  block:block_bio_complete                           [Tracepoint event]
  block:block_bio_frontmerge                         [Tracepoint event]
  block:block_bio_queue                              [Tracepoint event]
  ...
```

### List currently available dynamic probes.
```
sudo perf probe -l
```

# Counting Events 
PMC (Performance Monitoring Counter)

### Show PMC statistics for the command
```
sudo perf stat command
```
**Output**
```
 Performance counter stats for 'lsof':

         84.058044      task-clock (msec)         #    0.009 CPUs utilized          
             5,315      context-switches          #    0.063 M/sec                  
                 0      cpu-migrations            #    0.000 K/sec                  
               416      page-faults               #    0.005 M/sec                  
   <not supported>      cycles                                                      
   <not supported>      instructions                                                
   <not supported>      branches                                                    
   <not supported>      branch-misses                                               

       9.654675028 seconds time elapsed
```

### Show PMC for statistics for the PID
```
sudo perf stat -p PID
```

**Output**
```
^C
 Performance counter stats for process id '8534':

       7744.756184      task-clock (msec)         #    0.787 CPUs utilized          
            26,975      context-switches          #    0.003 M/sec                  
                 0      cpu-migrations            #    0.000 K/sec                  
                 0      page-faults               #    0.000 K/sec                  
   <not supported>      cycles                                                      
   <not supported>      instructions                                                
   <not supported>      branches                                                    
   <not supported>      branch-misses                                               

       9.846916606 seconds time elapsed
```

### Show PMC statistics for the entire system (5 seconds)
```
sudo perf stat -a sleep 5
```

**Output**
```

 Performance counter stats for 'system wide':

       5001.214217      cpu-clock (msec)          #    1.000 CPUs utilized          
            26,853      context-switches          #    0.005 M/sec                  
                 0      cpu-migrations            #    0.000 K/sec                  
                63      page-faults               #    0.013 K/sec                  
   <not supported>      cycles                                                      
   <not supported>      instructions                                                
   <not supported>      branches                                                    
   <not supported>      branch-misses                                               

       5.001246533 seconds time elapsed
```

### Count syscalls per second system-wide
```
sudo perf top -e 'raw_syscalls:sys_enter' -I 1000 -a
```

**Output**
```
Samples: 4K of event 'raw_syscalls:sys_enter', Event count (approx.): 2974
Overhead  Trace output
   2.22%  NR 1 (3, 7f0b092ea010, a00000, 22, ffffffff, 0)
   2.22%  NR 8 (3, 0, 0, 22, ffffffff, 0)
   1.95%  NR 0 (5, 5652de457510, 400, 5652de457904, 7ff0259437c0, 5652de45adc0)
   1.92%  NR 0 (5, 5652de457510, 400, 5652de4578f4, 7ff0259437c0, 5652de45adc0)
   1.85%  NR 0 (5, 5652de457510, 400, 5652de457900, 7ff0259437c0, 5652de45adc0)
   1.85%  NR 0 (5, 5652de457510, 400, 5652de457910, 7ff0259437c0, 5652de45adc0)
   1.78%  NR 0 (5, 5652de457510, 400, 5652de45790c, 7ff0259437c0, 5652de45adc0)
   1.75%  NR 0 (5, 5652de457510, 400, 5652de4578fc, 7ff0259437c0, 5652de45adc0)
   1.75%  NR 0 (5, 5652de457510, 400, 5652de457908, 7ff0259437c0, 5652de45adc0)
   1.68%  NR 0 (5, 5652de457510, 400, 5652de457902, 7ff0259437c0, 5652de45adc0)
```

### Count syscalls by type for the specified PID
```
sudo perf top -e 'syscalls:sys_enter_*' -p PID
```
**Output**
```
Available samples
411 syscalls:sys_enter_lseek                                                                                                                   ▒
0 syscalls:sys_enter_read                                                                                                                      ▒
411 syscalls:sys_enter_write                                                                                                                   ▒
0 syscalls:sys_enter_pread64                                                                                                                   
```

### Show sched events for process
```
sudo perf top -e 'sched:*' -p 8534 -ns comm
```

**Output**
```
Available samples
0 sched:sched_kthread_stop                                                                                                                     ◆
0 sched:sched_kthread_stop_ret                                                                                                                 ▒
276 sched:sched_waking                                                                                                                         ▒
276 sched:sched_wakeup                                                                                                                         ▒
0 sched:sched_wakeup_new                                                                                                                       ▒
58K sched:sched_switch                                                                                                                         ▒
0 sched:sched_migrate_task                                                                                                                     ▒
0 sched:sched_process_free                                                                                                                     ▒
0 sched:sched_process_exit                                                                                                                     ▒
0 sched:sched_wait_task                                                                                                                        ▒
0 sched:sched_process_wait                                                                                                                     ▒
0 sched:sched_process_fork                                                                                                                     ▒
0 sched:sched_process_exec                                                                                                                     ▒
0 sched:sched_stat_wait                                                                                                                        ▒
0 sched:sched_stat_sleep                                                                                                                       ▒
0 sched:sched_stat_iowait                                                                                                                      ▒
0 sched:sched_stat_blocked                                                                                                                     ▒
62K sched:sched_stat_runtime                                                                                                                   ▒
0 sched:sched_pi_setprio                                                                                                                       ▒
0 sched:sched_process_hang                                                                                                                     ▒
0 sched:sched_move_numa                                                                                                                        ▒
0 sched:sched_stick_numa                                                                                                                       ▒
0 sched:sched_swap_numa                                                                                                                        ▒
0 sched:sched_wake_idle_without_ipi 
```

###
```
sudo perf stat -e 'syscalls:sys_enter_*' -p 8534`
```

**Output**
```
^C
 Performance counter stats for process id '8534':

                 0      syscalls:sys_enter_socket                                   
                 0      syscalls:sys_enter_socketpair                                   
                 0      syscalls:sys_enter_bind                                     
                 0      syscalls:sys_enter_listen                                   
                 0      syscalls:sys_enter_accept4                                   
                 0      syscalls:sys_enter_accept                                   
                 0      syscalls:sys_enter_connect                                   
...
```

### Report Scheduler Statistics
```
sudo perf sched record -- sleep 10

[ perf record: Woken up 7 times to write data ]
failed to mmap file
[ perf record: Captured and wrote 13.804 MB perf.data ]

sudo perf sched latency

sudo perf sched timehist
```



