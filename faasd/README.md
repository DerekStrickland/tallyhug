# faasd on Nomad

## Links

- [Feb 10 Session Livestream recording](https://www.facebook.com/domistation/videos/654309529048819/)
- [Nomad release downloads](https://releases.hashicorp.com/nomad/)
- [Nomad Pack release downloads](https://releases.hashicorp.com/nomad-pack/)
- [faasd nomad pack](https://github.com/hashicorp/nomad-pack-community-registry/tree/main/packs/faasd)
- [Nomad Vagrant setup instructions](https://discuss.hashicorp.com/t/local-nomad-cluster-using-vagrant/33067/9?u=derekstrickland)
- [cows jobspec](cows.nomad)
- [client.hcl with `raw_exec` enabled](client.hcl)

## Instructions

- Use the Nomad Vagrant setup instructions above to get a local Nomad dev environment
- In a separate terminal SSH into the client with `vagrant ssh nomad-client01`
- Overwrite the `/etc/nomad.d/client.hcl` file with the one in this repo that has `raw_exec` enabled
- `sudo systemctl restart nomad` to restart Nomad on the client with the new configuration
- Keep this session open in the separate terminal so you can use it later
- Install `nomad` and `nomad-pack` from the release links above on your host machine - alternately you could work from inside one of the Vagrant machines
- Run `export NOMAD_ADDR=http://192.168.56.11:4646` to configure `nomad` to talk to the `nomad-server01` Vagrant machine
- Visit `http://192.168.56.11:4646` in your browser to visit the Nomad UI and make sure it's running
- Run `nomad-pack registry add default github.com/hashicorp/nomad-pack-community-registry` to download the community registry that has the `faasd` pack
- Run `nomad-pack run faasd` to install `faasd` to you Nomad cluster
- Check out `faasd` in the Nomad UI
- Run `nomad run cows.nomad` to submit the `cows.nomad` job from this repo
- Visit the Nomad UI to see that the job got registered and is running
- Switch back to the `nomad-client01` SSH session
- Run `10.0.2.15:8080`

You should see some ASCII art similar to this!

```shell
      ________________
     // (__)(__)||(__)\\
    //  (oo)(oo)||(oo) \\
   // \\"\/""\/"||"\/"/ \\
  / ============||=======\\
(|        |-    ||-       ||)
 |________|_____||________||/
  \-( O )----------( O )--/
     ---            ---
           Cowpool
```

## Summary

That's as far as we got in the first session. Next meetup we'll continue the exploration and determine if our cows job auto-registered with `faasd` as expected. We'll also take a look at the `faasd` pack to figure out how it works and if we can make it better. We'll live update this repo as part of the live coding session.

Thanks again for joining us, and as always Happy Hacking!


