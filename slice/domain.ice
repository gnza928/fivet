/*
 * MIT License
 *
 * Copyright (c) 2020 Diego Urrutia-Astorga <durrutia@ucn.cl>.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

// https://doc.zeroc.com/ice/3.7/language-mappings/java-mapping/client-side-slice-to-java-mapping/customizing-the-java-mapping
["java:package:cl.ucn.disc.pdis.fivet.zeroice"]
module model {

    /*
    *   The Persona
    */
    class Persona{

        string nombre;
        string direccion;
        long telefonoFijo;
        long telefonoMovil;
        string email;
        string rut;
    }

    enum Sexo { MACHO, HEMBRA }
    enum tipoPaciente { INTERNO, EXTERNO }

    /*
    *   The Ficha
    */
    class Ficha{

        long id;
        string nombre;
        string especie;
        string raza;
        string color;
        Sexo sexo;
        tipoPaciente tipo;

        //ISO_ZONED_DATE_TIME
        string fechaNacimiento;
    }

    /*
    *   The Control
    */
    class Control{

        // ISO_ZONED_DATE_TIME
        string fecha;

        // ISO_ZONED_DATE_TIME
        string proximoControl;

        long temperatura;
        long peso;
        long altura;
        string diagnostico;
        string veterinario;
    }

    /*
    *   The Examen
    */
    class Examen{
        string nombre;

        // ISO_ZONED_DATE_TIME
        string fecha;
    }

    /*
    *   The Foto
    */
    class Foto{
        string url;
    }

    /*
    * The Contratos
    */
    interface Contratos{

    Ficha obtenerFicha(int numero);

    void registrarPaciente(Ficha ficha);

    void registrarDueno(Persona dueno);

    void registrarControl(Control control);

    void agregarFoto(Foto foto);

    void agregarExamenes(List<Examen> examenes);
    }

    /**
     * The base system.
     */
     interface TheSystem {

        /**
         * @return the diference in time between client and server.
         */
        long getDelay(long clientTime);

     }

}
