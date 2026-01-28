import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.quiz.dev"
            resValue(type = "string", name = "app_name", value = "XelaApp (dev)")
        }
        create("stage") {
            dimension = "flavor-type"
            applicationId = "com.example.quiz.stage"
            resValue(type = "string", name = "app_name", value = "XelaApp (stg)")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.example.quiz"
            resValue(type = "string", name = "app_name", value = "XelaApp")
        }
    }
}