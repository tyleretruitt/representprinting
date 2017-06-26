using System.Web.Optimization;

namespace TwoTierWithTicketTracker
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Content/featherlight/src/featherlight.js",
                        "~/Content/featherlight/release/featherlight.gallery.min.js",
                        "~/Content/featherlight/src/featherlight.gallery.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/css/bootstrap.css",
                "~/Content/css/business-casual.css",
                "~/Content/featherlight/src/featherlight.gallery.css",
                "~/Content/featherlight/src/featherlight.css",
                "~/Content/featherlight/release/featherlight.gallery.min.css"

                      /*"~/Content/site.css"*/));
        }
    }
}
