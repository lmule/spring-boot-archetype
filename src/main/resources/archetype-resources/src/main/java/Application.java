package ${package};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import tk.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

@MapperScan(basePackages = "${package}.dao")
@EnableAutoConfiguration
@ComponentScan("com.magic80.springbootcommon")
@ComponentScan("${package}")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
