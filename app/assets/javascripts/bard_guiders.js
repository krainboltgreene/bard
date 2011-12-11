  /**
   * Guiders are created with guiders.createGuider({settings}).
   *
   * You can show a guiders with the .show() method immediately
   * after creating it, or with guiders.show(id) and the guiders's id.
   *
   * guiders.next() will advance to the next guiders, and
   * guiders.hideAll() will hide all guiders.
   *
   * By default, a button named "Next" will have guiders.next as
   * its onclick handler.  A button named "Close" will have
   * its onclick handler set to guiders.hideAll.  onclick handlers
   * can be customized too.
   */
   
  guiders.createGuider({
    buttons: [{name: "Next"}],
    description: "Bard is a gamefication.",
    id: "first",
    next: "second",
    overlay: true,
    title: "Welcome to Bard!"
  }).show();
  /**
   * .show() means that this guiders will get shown immediately after creation.
   *
   * Using .show() is one way of starting your guiders.
   * 
   * Another way is by directing the user to a special URL with the guiders id in
   * its hash tag, such as:
   *
   * http://www.local.com/README.html#guiders=first
   *
   * This makes it easy to only show guiders for new users.  It can also be used
   * to route people among multiple web pages and still keep showing the guiders.
   */

  guiders.createGuider({
    attachTo: "#Tour",
    buttons: [{name: "Close"},
              {name: "Next"}],
    description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
    id: "second",
    next: "third",
    position: 12,
    title: "Guiders are typically attached to an element on the page."
  });
             
  guiders.createGuider({
    attachTo: "#Tour",
    buttons: [{name: "Close, then click tour.", onclick: guiders.hideAll}],
    description: "Custom event handlers can be used to hide and show guiders. This allows you to interactively show the user how to use your software by having them complete steps. To try it, click on the clock.",
    id: "third",
    next: "fourth",
    position: 2,
    title: "You can advance guiders from custom event handlers.",
    width: 500
  });

  guiders.createGuider({
    attachTo: "#Tour",
    buttons: [{name: "Exit Guide", onclick: guiders.hideAll},
              {name: "Continue", onclick: guiders.next}],
    buttonCustomHTML: "<input type=\"checkbox\" id=\"stop_showing\" /><label for=\"stop_showing\" class=\"stopper\">Stop showing these. (Not implemented)</label>",
    description: "Other aspects of the guiders can be customized as well, such as the button names, button onclick handlers, and dialog widths. You'd also want to modify the CSS to your own project's style.",
    id: "fourth",
    next: "fifth",
    position: 7,
    title: "Guiders can be customized.",
    width: 600
  });

  guiders.createGuider({
    buttons: [{name: "Next"}],
    description: "Guiders can also be used to introduce of brand new features to existing users. Here is an example of a guiders in Gmail. Google's CSS calls this a promo, likely short for promotional box. <br/><br/> <img src=\"promo_gmail.png\" style=\"border: 1px solid #333;\" />",
    id: "fifth",
    next: "finally",
    overlay: true,
    width: 550
  });

  guiders.createGuider({
    buttons: [{name: "Close", classString: "primary-button"}],
    description: "To get started, have a look at this HTML file, then emulate it for use in your own project. You can also see Guiders in action on our site, <a href=\"http://www.optimizely.com/guiders\">www.optimizely.com</a>",
    id: "finally",
    overlay: true,
    title: "Great, so how do I get started?",
    width: 500
  });