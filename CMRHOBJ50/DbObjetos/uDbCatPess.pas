{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 134234
 Data da Alteração..: 26/04/2023
 Responsável........: Everson Cunha
 Descrição..........: Inclusão do campo dt_ultimo_dia_trab
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : Create
 N. SIG..........   : 38475.60437
 Data da Alteração: : 26/12/2017
 Alteração Form:    : uCtrlRegOcorr
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Inclusão de tratamento para os campos DATAOBITO e
                      IDACIDENTETRABALHO
--------------------------------------------------------------------------------
 Nº SOL:            250391.17474
 Nº PPM:            959204
 Data da Alteração: 08/04/2016
 Alteração Form:    Mudança no leiaute e novos campos
 Responsável:       Michelle Suellyn Mota
 Descrição:         Alterações de leiaute e novos campos para atender o eSocial.
 	                  Criação desta DB para manipular os registros da tabela
                    catpess.
--------------------------------------------------------------------------------}

unit uDbCatPess;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbCatPess = class(TCmDbObject)
  private
  
 {idcatpess              NUMBER not null,
  idpessoa               NUMBER not null,
  tiporegistrador        CHAR(1),
  tipoinscr              CHAR(1),
  numeroinscr            VARCHAR2(14),
  numerocat              VARCHAR2(20),
  tipoacidente           CHAR(1),
  tipocat                CHAR(1),
  dtacidente             DATE,
  horaacidente           CHAR(4),
  catemitidapor          CHAR(1),
  horastrabantesacid     CHAR(4),
  idsitgeradoraacidtrab  NUMBER(9),
  flgcomunicacaopolicial CHAR(1),
  flgobito               CHAR(1),
  idcidades              NUMBER,
  tipolocal              CHAR(1),
  desclocal              VARCHAR2(80),
  desclogradouro         VARCHAR2(80),
  numerologradouro       VARCHAR2(10),
  cnpj                   CHAR(14),
  dtcatorigem            DATE,
  idcatpessorigem        NUMBER,
  codcnes                NUMBER(7),
  dtatendimento          DATE,
  horaatendimento        CHAR(4),
  duracaotratamento      NUMBER,
  idnatlesao             NUMBER(9),
  desccomplementlesao    VARCHAR2(200),
  descdiagprovavel       VARCHAR2(100),
  flgafastamento         CHAR(1),
  flginternacao          CHAR(1),
  codcid                 VARCHAR2(7),
  idexaminador           NUMBER,
  orgaoclasse            CHAR(1),
  dataobito							 DATE,
  idacidentetrabalho	   NUMBER}
  
    Fidcatpess             : TCmDbField;
    Fidpessoa              : TCmDbField;
    //Ftiporegistrador       : TCmDbField; //Everson Cunha - SIG38475
    //Ftipoinscr             : TCmDbField; //Everson Cunha - SIG38475
    //Fnumeroinscr           : TCmDbField; //Everson Cunha - SIG38475
    Fnumerocat             : TCmDbField;
    Ftipoacidente          : TCmDbField;
    Ftipocat               : TCmDbField;
    Fdtacidente            : TCmDbField;
    Fhoraacidente          : TCmDbField;
    Fcatemitidapor         : TCmDbField;
    Fhorastrabantesacid    : TCmDbField;
    Fidsitgeradoraacidtrab : TCmDbField;
    Fflgcomunicacaopolicial: TCmDbField;
    Fflgobito              : TCmDbField;
    Fidcidades             : TCmDbField;
    Ftipolocal             : TCmDbField;
    //Fdesclocal             : TCmDbField; //Everson Cunha - SIG38475
    Fdesclogradouro        : TCmDbField;
    Fnumerologradouro      : TCmDbField;
    Fcnpj                  : TCmDbField;
    //Fdtcatorigem           : TCmDbField; //Everson Cunha - SIG38475
    Fidcatpessorigem       : TCmDbField;
    //Fcodcnes               : TCmDbField; //Everson Cunha - SIG38475
    Fdtatendimento         : TCmDbField;
    Fhoraatendimento       : TCmDbField;
    Fduracaotratamento     : TCmDbField;
    Fidnatlesao            : TCmDbField;
    //Fdesccomplementlesao   : TCmDbField; //Everson Cunha - SIG38475
    //Fdescdiagprovavel      : TCmDbField; //Everson Cunha - SIG38475
    Fflgafastamento        : TCmDbField;
    Fflginternacao         : TCmDbField;
    Fcodcid                : TCmDbField;
    Fidexaminador          : TCmDbField;
    Forgaoclasse           : TCmDbField;
    FDataObito						 : TCmDbField;
    //Everson Cunha - SIG38475 - Ini
    //FIdAcidenteTrabalho		 : TCmDbField;
    Fcep                           : TCmDbField;
    Fcod_agente_causador_acid_trab : TCmDbField;
    Flateral_parte_corpo_atingida  : TCmDbField;
    Fcod_parte_corpo_atingida      : TCmDbField;
    //Everson Cunha - SIG38475 - Fim
    Fdt_ultimo_dia_trab : TCmDbField; // Everson Cunha - SIG134234

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property idcatpess             : TCmDbField read Fidcatpess              write Fidcatpess;
    property idpessoa              : TCmDbField read Fidpessoa               write Fidpessoa;
    //property tiporegistrador       : TCmDbField read Ftiporegistrador        write Ftiporegistrador; //Everson Cunha - SIG38475
    //property tipoinscr             : TCmDbField read Ftipoinscr              write Ftipoinscr;       //Everson Cunha - SIG38475
    //property numeroinscr           : TCmDbField read Fnumeroinscr            write Fnumeroinscr;     //Everson Cunha - SIG38475
    property numerocat             : TCmDbField read Fnumerocat              write Fnumerocat;
    property tipoacidente          : TCmDbField read Ftipoacidente           write Ftipoacidente;
    property tipocat               : TCmDbField read Ftipocat                write Ftipocat;
    property dtacidente            : TCmDbField read Fdtacidente             write Fdtacidente;
    property horaacidente          : TCmDbField read Fhoraacidente           write Fhoraacidente;
    property catemitidapor         : TCmDbField read Fcatemitidapor          write Fcatemitidapor;
    property horastrabantesacid    : TCmDbField read Fhorastrabantesacid     write Fhorastrabantesacid;
    property idsitgeradoraacidtrab : TCmDbField read Fidsitgeradoraacidtrab  write Fidsitgeradoraacidtrab;
    property flgcomunicacaopolicial: TCmDbField read Fflgcomunicacaopolicial write Fflgcomunicacaopolicial;
    property flgobito              : TCmDbField read Fflgobito               write Fflgobito;
    property idcidades             : TCmDbField read Fidcidades              write Fidcidades;
    property tipolocal             : TCmDbField read Ftipolocal              write Ftipolocal;
    //property desclocal             : TCmDbField read Fdesclocal              write Fdesclocal; //Everson Cunha - SIG38475
    property desclogradouro        : TCmDbField read Fdesclogradouro         write Fdesclogradouro;
    property numerologradouro      : TCmDbField read Fnumerologradouro       write Fnumerologradouro;
    property cnpj                  : TCmDbField read Fcnpj                   write Fcnpj;
    //property dtcatorigem           : TCmDbField read Fdtcatorigem            write Fdtcatorigem; //Everson Cunha - SIG38475
    property idcatpessorigem       : TCmDbField read Fidcatpessorigem        write Fidcatpessorigem;
    //property codcnes               : TCmDbField read Fcodcnes                write Fcodcnes; //Everson Cunha - SIG38475
    property dtatendimento         : TCmDbField read Fdtatendimento          write Fdtatendimento;
    property horaatendimento       : TCmDbField read Fhoraatendimento        write Fhoraatendimento;
    property duracaotratamento     : TCmDbField read Fduracaotratamento      write Fduracaotratamento;
    property idnatlesao            : TCmDbField read Fidnatlesao             write Fidnatlesao;
    //property desccomplementlesao   : TCmDbField read Fdesccomplementlesao    write Fdesccomplementlesao; //Everson Cunha - SIG38475
    //property descdiagprovavel      : TCmDbField read Fdescdiagprovavel       write Fdescdiagprovavel; //Everson Cunha - SIG38475
    property flgafastamento        : TCmDbField read Fflgafastamento         write Fflgafastamento;
    property flginternacao         : TCmDbField read Fflginternacao          write Fflginternacao;
    property codcid                : TCmDbField read Fcodcid                 write Fcodcid;
    property idexaminador          : TCmDbField read Fidexaminador           write Fidexaminador;
    property orgaoclasse           : TCmDbField read Forgaoclasse            write Forgaoclasse;

    //Cássio Rovaroto - SIG nº 38475.60437 - Início
    property DataObito						 : TCmDbField read FDataObito 						 write FDataObito;
    //property IdAcidenteTrabalho		 : TCmDbField read FIdAcidenteTrabalho 		 write FIdAcidenteTrabalho; //Everson Cunha - SIG38475
    //Cássio Rovaroto - SIG nº 38475.60437 - Fim

    //Everson Cunha - SIG38475 - Ini
    property cep                           : TCmDbField read Fcep                           write Fcep;
    property cod_parte_corpo_atingida      : TCmDbField read Fcod_parte_corpo_atingida      write Fcod_parte_corpo_atingida;
    property lateral_parte_corpo_atingida  : TCmDbField read Flateral_parte_corpo_atingida  write Flateral_parte_corpo_atingida;
    property cod_agente_causador_acid_trab : TCmDbField read Fcod_agente_causador_acid_trab write Fcod_agente_causador_acid_trab;
    //Everson Cunha - SIG38475 - Fim
    property dt_ultimo_dia_trab : TCmDbField read Fdt_ultimo_dia_trab write Fdt_ultimo_dia_trab; //Everson Cunha - SIG134234

    end; 
	
implementation

{ TDbCatPess }

constructor TDbCatPess.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CatPess';

  Fidcatpess               := CreateCmDbField('idcatpess',ftFloat,true,true,false,true,'');
  Fidpessoa                := CreateCmDbField('idpessoa',ftFloat,true,true,false,true,'');
  //Ftiporegistrador         := CreateCmDbField('tiporegistrador',ftString,false,false,false,true,''); //Everson Cunha - SIG38475
  //Ftipoinscr               := CreateCmDbField('tipoinscr',ftString,false,false,false,true,'');       //Everson Cunha - SIG38475
  //Fnumeroinscr             := CreateCmDbField('numeroinscr',ftString,false,false,false,true,'');     //Everson Cunha - SIG38475
  Fnumerocat               := CreateCmDbField('numerocat',ftString,false,false,false,true,'');
  Ftipoacidente            := CreateCmDbField('tipoacidente',ftString,false,false,false,true,'');
  Ftipocat                 := CreateCmDbField('tipocat',ftString,false,false,false,true,'');
  Fdtacidente              := CreateCmDbField('dtacidente',ftDateTime,false,false,false,true,'');
  Fhoraacidente            := CreateCmDbField('horaacidente',ftString,false,false,false,true,'');
  Fcatemitidapor           := CreateCmDbField('catemitidapor',ftString,false,false,false,true,'');
  Fhorastrabantesacid      := CreateCmDbField('horastrabantesacid',ftString,false,false,false,true,'');
  Fidsitgeradoraacidtrab   := CreateCmDbField('idsitgeradoraacidtrab',ftFloat,false,false,false,true,'');
  Fflgcomunicacaopolicial  := CreateCmDbField('flgcomunicacaopolicial',ftString,false,false,false,true,'');
  Fflgobito                := CreateCmDbField('flgobito',ftString,false,false,false,true,'');
  Fidcidades               := CreateCmDbField('idcidades',ftFloat,false,false,false,true,'');
  Ftipolocal               := CreateCmDbField('tipolocal',ftString,false,false,false,true,'');
  //Fdesclocal               := CreateCmDbField('desclocal',ftString,false,false,false,true,''); //Everson Cunha - SIG38475
  Fdesclogradouro          := CreateCmDbField('desclogradouro',ftString,false,false,false,true,'');
  Fnumerologradouro        := CreateCmDbField('numerologradouro',ftString,false,false,false,true,'');
  Fcnpj                    := CreateCmDbField('cnpj',ftString,false,false,false,true,'');
  //Fdtcatorigem             := CreateCmDbField('dtcatorigem',ftDateTime,false,false,false,true,''); //Everson Cunha - SIG38475
  Fidcatpessorigem         := CreateCmDbField('idcatpessorigem',ftString,false,false,false,true,'');
  //Fcodcnes                 := CreateCmDbField('codcnes',ftFloat,false,false,false,true,''); //Everson Cunha - SIG38475
  Fdtatendimento           := CreateCmDbField('dtatendimento',ftDateTime,false,false,false,true,'');
  Fhoraatendimento         := CreateCmDbField('horaatendimento',ftString,false,false,false,true,'');
  Fduracaotratamento       := CreateCmDbField('duracaotratamento',ftFloat,false,false,false,true,'');
  Fidnatlesao              := CreateCmDbField('idnatlesao',ftFloat,false,false,false,true,'');
  //Fdesccomplementlesao     := CreateCmDbField('desccomplementlesao',ftString,false,false,false,true,''); //Everson Cunha - SIG38475
  //Fdescdiagprovavel        := CreateCmDbField('descdiagprovavel',ftString,false,false,false,true,''); //Everson Cunha - SIG38475
  Fflgafastamento          := CreateCmDbField('flgafastamento',ftString,false,false,false,true,'');
  Fflginternacao           := CreateCmDbField('flginternacao',ftString,false,false,false,true,'');
  Fcodcid                  := CreateCmDbField('codcid',ftString,false,false,false,true,'');
  Fidexaminador            := CreateCmDbField('idexaminador',ftFloat,false,false,false,true,'');
  Forgaoclasse             := CreateCmDbField('orgaoclasse',ftString,false,false,false,true,'');
  //Cássio Rovaroto - SIG nº 38475.60437 - Início
  FDataObito         			 := CreateCmDbField('DATAOBITO', ftDateTime, false, false, false, true, '');
  //FIdAcidenteTrabalho      := CreateCmDbField('IDACIDENTETRABALHO', ftFloat, false, false, false, true, ''); //Everson Cunha - SIG38475
  //Cássio Rovaroto - SIG nº 38475.60437 - Fim

  //Everson Cunha - SIG38475 - Ini
  Fcep                           := CreateCmDbField('cep',ftString,false,false,false,true,'');
  Fcod_parte_corpo_atingida      := CreateCmDbField('cod_parte_corpo_atingida',ftFloat,false,false,false,true,'');
  Flateral_parte_corpo_atingida  := CreateCmDbField('lateral_parte_corpo_atingida',ftString,false,false,false,true,'');
  Fcod_agente_causador_acid_trab := CreateCmDbField('cod_agente_causador_acid_trab',ftFloat,false,false,false,true,'');
  //Everson Cunha - SIG38475 - Fim
  Fdt_ultimo_dia_trab      			 := CreateCmDbField('DT_ULTIMO_DIA_TRAB', ftDateTime, false, false, false, true, ''); //Everson Cunha - SIG134234
end;
end.
