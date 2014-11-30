```
title: Upgrading an old Macbook
layout: post
tags: ['intro','post']
comments: true
date: 10 February 2013
```
I have a trustworthy 2008 Macbook pro. While it had served me pretty well over years it was clear that it was on it's last legs. It took about 100 seconds to boot and about half that time to shut down. And loading Lightroom with about 15 odd tabs in Chrome was bringing the system to it's knees. So I started looking at upgrade options, specifically, the new macbook pro with the retina screen. While this was an option, I wasn't keen on it due the steep price on it due to the retina screen. After much research and trolling Apple forums, I decided against the retina version due to severe upgrade limitations. When Macbook pro was originally release it was given a lot of upgrade options as a nod to power users, who could then trim it to their needs using after market parts. But the new versions seem to depart from that design philosophy. Coming back, now that buying the macbook pro was out of the reckoning, upgrading the one I had on hand was the next option. I analysed my mac and found 3 issues that could be easily corrected by spending a small amount.

<!-- Read more -->
> 1. The charger had suffered the infamous macbook pro <a href="http://www.tuaw.com/2011/11/08/apple-launches-magsafe-adapter-replacement-program/">frayed cable</a> problem
> 2. The battery was holding about a fourth of the original capacity and took an eternity to charge if it ran out
> 3. The third and the replacement that will give the most bang for the buck was to swap out the HDD with a solid state drive

### Charger & Battery Replacement
To fix the first two issues, I just went to an apple store and picked up the replacements. Mine was a 15 inch mac and I got the appropriately sized battery and the 85 watt charger. This came to about $210.
         
### HDD Replacement
Replacing the disk drive with SSD meant that a lot of things had to be considered since the Macbook pro I had was one of the older ones.

To begin with, the Sata speed that this version of macbook pro operated was SATA 2 and some people were facing issues with some of the new solid state drives. If you go to the System Information utility on the macbook pro and select Serial-ATA, the right panes would display the Sata devices that the machine uses. In the 08 version, it would be a DVD drive and disk drive. The right bottom pane would list the various parameters for the sata devices. The parameters to look for are 'Link Speed' and 'Negotiated Link Speed'. Now this is the sata transfer rates. For SATA 2 this would be 3 gigabits. Link Speed is the speed that the link can operate. Under some conditions, some SSD controllers, were auto-negotiating to a 1.5 gigabit (SATA1.5) speed when they found a non SATA3 connector. Among the SSDs I evaluated, I found that Crucial m4 had the least of such issues and decided to go with that. For my needs, I got the <a href="http://www.amazon.com/Crucial-256GB-2-5-Inch-Solid-CT256M4SSD2/dp/B004W2JL2A/">256GB</a> version.

Before replacing the drives, I did a disk performance test on the older hard drive and backed up the data. The blackmagic disk speed test utility indicated that I was getting about 47 Mbps write speed. From what I read, I expected the upgrade to give me about twice that. To replace the disk, I needed some tools, primarily a couple of precision screwdrivers. To remove the hard drive from it's location, one needs the <a href="http://www.amazon.com/Wiha-26194-Screwdriver-Phillips-Precision/dp/B000NZ5QGK/">Phillips #00</a> screwdriver. The Hard drive itself is mounted on a bracket using a torx screw. This screw will have to be removed and be reused in the new SSD. To remove this a <a href="http://www.amazon.com/Wiha-96706-Screwdriver-Precision-Handle/dp/B000T9SDB0/">Torx T6</a> screwdriver is required. For step-by-step instructions on how the hard disk needs to be replaced, refer to this <a href="http://www.ifixit.com/Guide/MacBook+Pro+15-Inch+Unibody+Late+2008+and+Early+2009+Hard+Drive+Replacement/841/1">guide</a> on ifixit.
         
### OS Upgrade
I was expecting the OS upgrade to be easy but ran into a bit of heavy weather. My original plan was to make a bootable USB with mountain lion on it. Creating the bootable USB was easy. <a href="http://www.macworld.com/article/1167857/how_to_make_a_bootable_mountain_lion_install_drive.html">This</a> article does a pretty good job of detailing the process. But after I booted using the USB, I could not control the track pad and the installer was stuck asking me to agree on the terms! So, I put the hard drive in a cheap <a href="http://www.amazon.com/Vantec-NexStar-2-5-Inch-External-Enclosure/dp/B002JQNXZC">hard drive enclosure</a> and used it as a bootable USB drive. I then installed the SSD in the mac and booted the laptop using the USB drive. Once booted into the old snow leopard, I started the mountain lion installer and selected the SSD as the drive to install the OS and from there the installer proceeded smoothly.

### Performance 
After I had mountain lion installed and running, it was time to check if all my efforts were worth it. I ran black magic speed test on the SSD disk. I got about 195 Mbps, almost 4 times the older HDD. That explained the new boot time of 30 seconds. So, for a price of a netbook, I have got a fairly good return on my investment.
