// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

class Pokemon {
  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  List<Ability> abilities;
  int baseExperience;
  List<Species> forms;
  List<GameIndex> gameIndices;
  int height;
  List<dynamic> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Move> moves;
  String name;
  int order;
  List<dynamic> pastTypes;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  int weight;

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    abilities: List<Ability>.from(
      json["abilities"].map((x) => Ability.fromJson(x))),
    baseExperience: json["base_experience"],
    forms:
      List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
    gameIndices: List<GameIndex>.from(
      json["game_indices"].map((x) => GameIndex.fromJson(x))),
    height: json["height"],
    heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
    id: json["id"],
    isDefault: json["is_default"],
    locationAreaEncounters: json["location_area_encounters"],
    moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
    name: json["name"],
    order: json["order"],
    pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    species: Species.fromJson(json["species"]),
    sprites: Sprites.fromJson(json["sprites"]),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "base_experience": baseExperience,
    "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
    "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
    "height": height,
    "held_items": List<dynamic>.from(heldItems.map((x) => x)),
    "id": id,
    "is_default": isDefault,
    "location_area_encounters": locationAreaEncounters,
    "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
    "name": name,
    "order": order,
    "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
    "species": species.toJson(),
    "sprites": sprites.toJson(),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "weight": weight,
  };
}

class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  Species ability;
  bool isHidden;
  int slot;

  factory Ability.fromRawJson(String str) => Ability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    ability: Species.fromJson(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "ability": ability.toJson(),
    "is_hidden": isHidden,
    "slot": slot,
  };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromRawJson(String str) => Species.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  int gameIndex;
  Species version;

  factory GameIndex.fromRawJson(String str) => GameIndex.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
    gameIndex: json["game_index"],
    version: Species.fromJson(json["version"]),
  );

  Map<String, dynamic> toJson() => {
    "game_index": gameIndex,
    "version": version.toJson(),
  };
}

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  Species move;
  List<VersionGroupDetail> versionGroupDetails;

  factory Move.fromRawJson(String str) => Move.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Move.fromJson(Map<String, dynamic> json) => Move(
    move: Species.fromJson(json["move"]),
    versionGroupDetails: List<VersionGroupDetail>.from(
      json["version_group_details"]
        .map((x) => VersionGroupDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "move": move.toJson(),
    "version_group_details":
      List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
  };
}

class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  int levelLearnedAt;
  Species moveLearnMethod;
  Species versionGroup;

  factory VersionGroupDetail.fromRawJson(String str) =>
    VersionGroupDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
    VersionGroupDetail(
      levelLearnedAt: json["level_learned_at"],
      moveLearnMethod: Species.fromJson(json["move_learn_method"]),
      versionGroup: Species.fromJson(json["version_group"]),
    );

  Map<String, dynamic> toJson() => {
    "level_learned_at": levelLearnedAt,
    "move_learn_method": moveLearnMethod.toJson(),
    "version_group": versionGroup.toJson(),
  };
}

class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  Sprites blackWhite;

  factory GenerationV.fromRawJson(String str) =>
    GenerationV.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
    blackWhite: Sprites.fromJson(json["black-white"]),
  );

  Map<String, dynamic> toJson() => {
    "black-white": blackWhite.toJson(),
  };
}

class GenerationIv {
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  Sprites diamondPearl;
  Sprites heartgoldSoulsilver;
  Sprites platinum;

  factory GenerationIv.fromRawJson(String str) => GenerationIv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
    diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
    heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
    platinum: Sprites.fromJson(json["platinum"]),
  );

  Map<String, dynamic> toJson() => {
    "diamond-pearl": diamondPearl.toJson(),
    "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
    "platinum": platinum.toJson(),
  };
}

class Versions {
  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  GenerationI generationI;
  GenerationIi generationIi;
  GenerationIii generationIii;
  GenerationIv generationIv;
  GenerationV generationV;
  GenerationVi generationVi;
  GenerationVii generationVii;
  GenerationViii generationViii;

  factory Versions.fromRawJson(String str) => Versions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
    generationI: GenerationI.fromJson(json["generation-i"]),
    generationIi: GenerationIi.fromJson(json["generation-ii"]),
    generationIii: GenerationIii.fromJson(json["generation-iii"]),
    generationIv: GenerationIv.fromJson(json["generation-iv"]),
    generationV: GenerationV.fromJson(json["generation-v"]),
    generationVi: GenerationVi.fromJson(json["generation-vi"]),
    generationVii: GenerationVii.fromJson(json["generation-vii"]),
    generationViii: GenerationViii.fromJson(json["generation-viii"]),
  );

  Map<String, dynamic> toJson() => {
    "generation-i": generationI.toJson(),
    "generation-ii": generationIi.toJson(),
    "generation-iii": generationIii.toJson(),
    "generation-iv": generationIv.toJson(),
    "generation-v": generationV.toJson(),
    "generation-vi": generationVi.toJson(),
    "generation-vii": generationVii.toJson(),
    "generation-viii": generationViii.toJson(),
  };
}

class Sprites {
  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  factory Sprites.fromRawJson(String str) => Sprites.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    backDefault: json["back_default"],
    backFemale: json["back_female"],
    backShiny: json["back_shiny"],
    backShinyFemale: json["back_shiny_female"],
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
    other: json["other"] == null ? null : Other.fromJson(json["other"]),
    versions: json["versions"] == null
      ? null
      : Versions.fromJson(json["versions"]),
    animated: json["animated"] == null
      ? null
      : Sprites.fromJson(json["animated"]),
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
    "other": other?.toJson(),
    "versions": versions?.toJson(),
    "animated": animated?.toJson(),
  };
}

class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  RedBlue redBlue;
  RedBlue yellow;

  factory GenerationI.fromRawJson(String str) => GenerationI.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
    redBlue: RedBlue.fromJson(json["red-blue"]),
    yellow: RedBlue.fromJson(json["yellow"]),
  );

  Map<String, dynamic> toJson() => {
    "red-blue": redBlue.toJson(),
    "yellow": yellow.toJson(),
  };
}

class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  String backDefault;
  String backGray;
  String backTransparent;
  String frontDefault;
  String frontGray;
  String frontTransparent;

  factory RedBlue.fromRawJson(String str) => RedBlue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
    backDefault: json["back_default"],
    backGray: json["back_gray"],
    backTransparent: json["back_transparent"],
    frontDefault: json["front_default"],
    frontGray: json["front_gray"],
    frontTransparent: json["front_transparent"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_gray": backGray,
    "back_transparent": backTransparent,
    "front_default": frontDefault,
    "front_gray": frontGray,
    "front_transparent": frontTransparent,
  };
}

class GenerationIi {
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  Crystal crystal;
  Gold gold;
  Gold silver;

  factory GenerationIi.fromRawJson(String str) => GenerationIi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
    crystal: Crystal.fromJson(json["crystal"]),
    gold: Gold.fromJson(json["gold"]),
    silver: Gold.fromJson(json["silver"]),
  );

  Map<String, dynamic> toJson() => {
    "crystal": crystal.toJson(),
    "gold": gold.toJson(),
    "silver": silver.toJson(),
  };
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  String backDefault;
  String backShiny;
  String backShinyTransparent;
  String backTransparent;
  String frontDefault;
  String frontShiny;
  String frontShinyTransparent;
  String frontTransparent;

  factory Crystal.fromRawJson(String str) => Crystal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
    backDefault: json["back_default"],
    backShiny: json["back_shiny"],
    backShinyTransparent: json["back_shiny_transparent"],
    backTransparent: json["back_transparent"],
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
    frontShinyTransparent: json["front_shiny_transparent"],
    frontTransparent: json["front_transparent"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_shiny": backShiny,
    "back_shiny_transparent": backShinyTransparent,
    "back_transparent": backTransparent,
    "front_default": frontDefault,
    "front_shiny": frontShiny,
    "front_shiny_transparent": frontShinyTransparent,
    "front_transparent": frontTransparent,
  };
}

class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    this.frontTransparent,
  });

  String backDefault;
  String backShiny;
  String frontDefault;
  String frontShiny;
  String? frontTransparent;

  factory Gold.fromRawJson(String str) => Gold.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
    backDefault: json["back_default"],
    backShiny: json["back_shiny"],
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
    frontTransparent: json["front_transparent"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_shiny": backShiny,
    "front_default": frontDefault,
    "front_shiny": frontShiny,
    "front_transparent": frontTransparent,
  };
}

class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  OfficialArtwork emerald;
  Gold fireredLeafgreen;
  Gold rubySapphire;

  factory GenerationIii.fromRawJson(String str) => GenerationIii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
    emerald: OfficialArtwork.fromJson(json["emerald"]),
    fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
    rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
  );

  Map<String, dynamic> toJson() => {
    "emerald": emerald.toJson(),
    "firered-leafgreen": fireredLeafgreen.toJson(),
    "ruby-sapphire": rubySapphire.toJson(),
  };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  String frontDefault;
  String frontShiny;

  factory OfficialArtwork.fromRawJson(String str) => OfficialArtwork.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
    OfficialArtwork(
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_shiny": frontShiny,
  };
}

class GenerationVi {
  GenerationVi({
    required this.omegarubyAlphasapphire,
    required this.xY,
  });

  Home omegarubyAlphasapphire;
  Home xY;

  factory GenerationVi.fromRawJson(String str) => GenerationVi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationVi.fromJson(Map<String, dynamic> json) => GenerationVi(
    omegarubyAlphasapphire: Home.fromJson(json["omegaruby-alphasapphire"]),
    xY: Home.fromJson(json["x-y"]),
  );

  Map<String, dynamic> toJson() => {
    "omegaruby-alphasapphire": omegarubyAlphasapphire.toJson(),
    "x-y": xY.toJson(),
  };
}

class Home {
  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromRawJson(String str) => Home.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  DreamWorld icons;
  Home ultraSunUltraMoon;

  factory GenerationVii.fromRawJson(String str) => GenerationVii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
    icons: DreamWorld.fromJson(json["icons"]),
    ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
  );

  Map<String, dynamic> toJson() => {
    "icons": icons.toJson(),
    "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
  };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  String frontDefault;
  dynamic frontFemale;

  factory DreamWorld.fromRawJson(String str) => DreamWorld.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
  };
}

class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  DreamWorld icons;

  factory GenerationViii.fromRawJson(String str) => GenerationViii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
    icons: DreamWorld.fromJson(json["icons"]),
  );

  Map<String, dynamic> toJson() => {
    "icons": icons.toJson(),
  };
}

class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  DreamWorld dreamWorld;
  Home home;
  OfficialArtwork officialArtwork;

  factory Other.fromRawJson(String str) => Other.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromJson(json["dream_world"]),
    home: Home.fromJson(json["home"]),
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld.toJson(),
    "home": home.toJson(),
    "official-artwork": officialArtwork.toJson(),
  };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  int baseStat;
  int effort;
  Species stat;

  factory Stat.fromRawJson(String str) => Stat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Species.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  int slot;
  Species type;

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}
