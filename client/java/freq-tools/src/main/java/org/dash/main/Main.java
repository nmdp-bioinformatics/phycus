package org.dash.main;

import java.net.MalformedURLException;

import javax.swing.UIManager;

import org.dishevelled.commandline.ArgumentList;
import org.dishevelled.commandline.CommandLine;
import org.dishevelled.commandline.CommandLineParseException;
import org.dishevelled.commandline.CommandLineParser;
import org.dishevelled.commandline.Switch;
import org.dishevelled.commandline.Usage;
import org.dishevelled.commandline.argument.FileArgument;
import org.dishevelled.commandline.argument.StringArgument;
import org.dishevelled.commandline.argument.URLArgument;

// import org.dash.freq.*;
import org.dash.freq.gui.Gui;
import org.dash.freq.uploadData.*;

public class Main {

	private static final String USAGE = "post-population-frequencies [args]";


	/**
	 * Main.
	 *
	 * @param args command line args
	 * @throws MalformedURLException
	 */

	public static void main(final String args[]) throws MalformedURLException {
		
		Switch about = new Switch("a", "about", "display about message");
		Switch gui = new Switch("g", "gui", "open the GUI");
		Switch help = new Switch("h", "help", "display help message");
		FileArgument inputFile = new FileArgument("i", "input-file", "input file, default stdin", false);
		StringArgument gtRegistry = new StringArgument("r", "registry", "genotype registry", false);
		StringArgument estEntity = new StringArgument("e", "estimator", "haplotype frequency estimating entity", false);
		URLArgument url = new URLArgument("u", "url", "frequency service url", false);

		ArgumentList arguments = new ArgumentList(about, gui, help, inputFile, gtRegistry, estEntity, url);
		CommandLine commandLine = new CommandLine(args);

		PostPopulationFrequencies postPopulationFrequencies = null;
		try {
			CommandLineParser.parse(commandLine, arguments);
			// if (about.wasFound()) {
			// 	About.about(System.out);
			// 	System.exit(0);
			// }
			if (gui.wasFound()) {
				/* Create and display the form */
				java.awt.EventQueue.invokeLater(new Runnable() {
				    public void run() {
				    	try {
							UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel");
						} catch(Exception ex) { System.out.println("Problem setting look and feel: " + ex); }

				        new Gui().setVisible(true);
				    }
				});
			}
			if (help.wasFound()) {
				Usage.usage(USAGE, null, commandLine, arguments, System.out);
				System.exit(0);
			}

			// postPopulationFrequencies = new PostPopulationFrequencies(
			// 						inputFile.getValue(), gtRegistry.getValue(),
			// 						estEntity.getValue(), url.getValue());
		} catch (CommandLineParseException | IllegalArgumentException e) {
	  		Usage.usage(USAGE, e, commandLine, arguments, System.err);
			System.exit(-1);
		}
		try {
			// System.exit(postPopulationFrequencies.call());
		} catch (Exception ex) {
			ex.printStackTrace();
			System.exit(1);
		}
	}
}