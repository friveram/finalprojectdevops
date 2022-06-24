# Proyecto Final DevOps 2022
Universidad Galileo - Posgrado en Redes de Computadoras
* Kevin Alexis Garcia Monroy - 13282057
* Fredy Alexander Rivera Monzón - 18001956
* Gerson Valdez - 06343006
* Victor Alberto Vargas Contreras - 22000898

## Descripcion del Proyecto
El proyecto consiste en un despliegue de un blog con Wordpress utilizando la nube de Digitalocean el cual es monitoreado con Datadog. Este despliegue es desencadenado a partir de realizar un push al repositorio el cual activa un pipeline de Githubactions y realiza las siguientes acciones en la nube de Digitalocean:

* Se crea una VPC especifica para el deployment
* Se crea un droplet el cual estara ejecutando la aplicacion de blog. Este droplet se asigna a la VPC que se creò en el paso anterior.
* Una vez el droplet esta creado, se provisiona utilizando Ansible para que pueda realizar la instalacion de apache, mysql, wordpress, php y todo las configuraciones necesarias para que la aplicaciòn se levante.
* Luego del provisionamiento, se intala el agente de Datadog y se realizan las configuraciones necesarias para que el droplet pueda ser monitoreado con mètricas desempeño como CPU, RAM, I/O asì como logs de la aplicaciòn.

## Instrucciones
Seguir los siguientes pasos para implementar o recrear la implementacion de este proyecto:

**Se recomienda realizar los siguientes pasos en un entorno de Linux, tambièn debe tener una cuenta en github, Digitalocean y en Datadog**

1. Cree su propio repositorio en su cuenta de Github en donde realizarà sus pruebas. Para fines de este ejemplo el respositorio se llamarà *repo-ejemplo*.
2. Cree un token en su cuenta de Digitalocean y copielo en un lugar seguro.
3. En el repositorio que creò, crear un secret con el token de Digitalocean. Para esto dirigirse a su repositorio luego Settings -> Secrets -> Actions -> New Repository Secret. En el campo de name colocar DIGITALOCEAN_ACCESS_TOKEN y en el campo de value pegue el token que generò con Digitalocean.
4. En su entorno de Linux, clonar el repositorio de este proyecto y tambièn su repositorio que està vacìo por el momento.
```bash
git clone https://github.com/friveram/finalprojectdevops.git
git clone https://github.com/su-usuario/repo-ejemplo.git
```
5. Con los repositorios clonados, copie todo el contenido del directorio *finalprojectdevops* al directorio *repo-ejemplo*.
```bash
cd ~/finalprojectdevops
cp -r * ../repo-ejemplo
```
6. Dirigirse a su repositorio.
```bash
cd ../repo-ejemplo
```
7. Antes de iniciar el proyecto, se debe hacer una modificaciòn en el script para que el agente de Datadog que se instale en el droplet sea el correcto que apunte a su cuenta de Datadog. Para esto, dirigirse a su cuenta de Datadog y luego Integrations -> Agent -> CentOS/Red Hat y copiar el comando que aparece en el paso 1 de la pàgina de Datadog.
8. Con el comando copiado de su cuenta de Datadog, dirigirse al archivo repo-ejemplo/script.sh y elmine el comando que aparece en la lìnea nùmero 11 y pege el comando que usted copiò de su cuenta de Datadog. Guarde los cambios.
9. Con todo esto listo, ya se puede proceder a realizar el push de todos estos archivos a su repositorio y con este push desencadenar el pipeline de Githubaciotns que desplegarà la aplicaciòn en su cuenta de Digitalocean. Correr los siguientes comandos en el directorio de *repo-ejemplo*
```bash
git add .
git commit -m "Mensaje de commit, cambielo si quiere"
git push
```