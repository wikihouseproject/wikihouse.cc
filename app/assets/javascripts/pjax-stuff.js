// $(document).ready(function() {
//   if (window.pjax) { return }
//   window.pjax = new Pjax({
//     elements: "a", // default is "a[href], form[action]"
//     selectors: ["title", "meta[name=csrf-token]", "#sub-header", "#main"],
//     switches: {
//       "#main": require("pjax/lib/switches.js").sideBySide,
//       "#sub-header": Pjax.sideBySide
//     },
//     switchesOptions: {
//       "#main": {
//         classNames: {
//           remove: "Animated Animated--reverse Animate--fast Animate--noDelay",
//           add: "Animated",
//           backward: "Animate--slideInDown",
//           forward: "Animate--slideInUp"
//         },
//         callbacks: {
//           removeElement: function(el) {
//           alert("A")
//             el.style.marginLeft = "-" + (el.getBoundingClientRect().width/2) + "px"
//           }
//         }
//       },

//       "#sub-header": {
//         classNames: {
//           remove: "Animated Animated--reverse Animate--fast Animate--noDelay",
//           add: "Animated",
//           backward: "Animate--slideInDown",
//           forward: "Animate--slideInUp"
//         },
//         callbacks: {
//           removeElement: function(el) {
//             el.style.marginLeft = "-" + (el.getBoundingClientRect().width/2) + "px"
//           }
//         }
//       }
//     }
//   })
// });
