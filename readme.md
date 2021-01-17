*Kunne ikke få aalgoritmen til at genere gode generationer, men der er en kunstig intelligens med evolutionsalgoritmen indbygget til at generere nye genereationer.* 

Systemet fungerer således: 
 1. Generér generation 0
 2. Tilføj "generne" fra bilerne x antal gange til en genpulje alt efter deres fitness*
 3. Generér en ny generation baseret på genpuljen
 4. Gå til punkt 2

**Fitness** beregnes ud fra lapTime.
Der er lavet en klasse "DNA"

    class DNA {
	    float[] weights = new float[8];
		float[] biases = new float[3];
    }
 som kan holde information om generne, der skal bruges. Det er en nemmere måde at håndtere generne til nye generationer end en masse flerdimensionelle arrays. 
 Som det ses i kodeudklippet, holder hvert DNA-objekt to arrays med hhv. vægte og biases. De bruges til de nye generation. DNA-klassen indeholder også nogle konstruktører og nogle metoder, der bruges i forbindelse med genereringen af nye generationer. 
 
 