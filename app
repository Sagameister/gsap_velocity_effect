let proxy = {
        skew: 3
    },
    skewSetter = gsap.quickSetter(".skewelem", "skewY", "deg"), // fast
    clamp = gsap.utils.clamp(-20, 20); // don't let the skew go beyond 20 degrees. 

ScrollTrigger.create({
    onUpdate: (self) => {
        let skew = clamp(self.getVelocity() / -800);
        if (Math.abs(skew) > Math.abs(proxy.skew)) {
            proxy.skew = skew;
            gsap.to(proxy, {
                skew: 0,
                duration: 1.5,
                ease: "power3",
                overwrite: true,
                onUpdate: () => skewSetter(proxy.skew)
            });
        }
    }
});

// make the right edge "stick" to the scroll bar. force3D: true improves performance
gsap.set(".skewelem", {
    transformOrigin: "right center",
    force3D: true
});
