{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 134234
 Data da Alteração..: 26/04/2023
 Responsável........: Everson Cunha
 Descrição..........: Inclusão do campo dt_validade_aso
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : Create
 N. SIG..........   : 38475.60437
 Data da Alteração: : 22/12/2017
 Alteração Form:    : uDbHstAsMed
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Criação de tratamento para os campos FLGAFASTANTERIOR,
                      ORIGEMRET e IDPROCESSO
--------------------------------------------------------------------------------
 Nº SOL            : 250391.17474
 Nº PPM            : 959204
 Data da Alteração : 28/04/2016
 Alteração Form    : Leiaute e campos novos
 Responsável       : Michelle Suellyn Mota
 Descrição         : Mudança no leiaute e campos novos para adequar ao eSocial
 			               Alteração nesta DB para criar novos campos da tabela
                     HstAsMed.
--------------------------------------------------------------------------------
 Nº SOL            : 250384.17324
 Nº PPM            : 1070235
 Data da Alteração : 24/02/2016
 Alteração Form    : Leiaute e campos novos
 Responsável       : Michelle Suellyn Mota
 Descrição         : Mudança no leiaute e campos novos para adequar ao eSocial
			               Alteração nesta DB para criar novos campos da tabela
                     HstAsMed.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 30/09/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstAsMed;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHstAsMed = class(TCmDbObject)
  private
    FDataReal: TCmDbField;
    FExaminador: TCmDbField;
    FAvaliacao: TCmDbField;
    FIdExaminador: TCmDbField;
    FDataPlan: TCmDbField;
    FNumSeq: TCmDbField;
    FCodCID: TCmDbField;
    FObservacao: TCmDbField;
    FIdPessoa: TCmDbField;
    FLicenca: TCmDbField;
    FCodTipoOcMed: TCmDbField;
// Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    {FCODPTCORPESOCIAL: TCmDbField;
    FCODAGTESOCIAL: TCmDbField;
    FCODSDOENCAESOCIAL: TCmDbField;
    FCODSTESOCIAL: TCmDbField;
    FCODNTESOCIAL: TCmDbField;}
// Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  {  FDESC1 : TCmDbField;
    FDESC2 : TCmDbField;
    FDESC3 : TCmDbField;
    FDESC4 : TCmDbField;
    FDESC5 : TCmDbField;
   }
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    Fidhstasmed: TCmDbField;
    Fidmotivo: TCmDbField;
    FTipoAcidTransito: TCmDbField;
    FDtAso: TCmDbField;
    FTipoAso: TCmDbField;

    //Everson Cunha - SIG38475 - Ini
    //FCodProcedMedTuss: TCmDbField;
    //FOrgaoClasse: TCmDbField;
    //FCodCnes: TCmDbField;
    //FContato: TCmDbField;
    //FEmail: TCmDbField;
    //FFlgAlteraMotivo: TCmDbField;
    //FFlgEfeitoRetro: TCmDbField;
    //FIdAtestadoAnt: TCmDbField;
    //Everson Cunha - SIG38475 - Fim

    //Cássio Rovaroto - SIG nº 38475.60437 - Início
    FOrigemRet: TCmDbField;
    FFlgAfastAnterior: TCmDbField;
    FIdProcesso: TCmDbField;
    //Cássio Rovaroto - SIG nº 38475.60437 - Fim
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    Fdt_validade_aso : TCmDbField; //Everson Cunha - SIG134234
  public

    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property CodTipoOcMed: TCmDbField read FCodTipoOcMed write FCodTipoOcMed;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property IdExaminador: TCmDbField read FIdExaminador write FIdExaminador;
    property Examinador: TCmDbField read FExaminador write FExaminador;
    property DataReal: TCmDbField read FDataReal write FDataReal;
    property DataPlan: TCmDbField read FDataPlan write FDataPlan;
    property CodCID: TCmDbField read FCodCID write FCodCID;
    property Licenca: TCmDbField read FLicenca write FLicenca;
    property Avaliacao: TCmDbField read FAvaliacao write FAvaliacao;
    property Observacao: TCmDbField read FObservacao write FObservacao;

// Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
   { property CODPTCORPESOCIAL: TCmDbField read FCODPTCORPESOCIAL write FCODPTCORPESOCIAL;
    property CODAGTESOCIAL: TCmDbField read FCODAGTESOCIAL write FCODAGTESOCIAL;
    property CODSDOENCAESOCIAL: TCmDbField read FCODSDOENCAESOCIAL write FCODSDOENCAESOCIAL;
    property CODSTESOCIAL: TCmDbField read FCODSTESOCIAL write FCODSTESOCIAL;
    property CODNTESOCIAL: TCmDbField read FCODNTESOCIAL write FCODNTESOCIAL;   }
// Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
 {   FDESC1 : TCmDbField;
    FDESC2 : TCmDbField;
    FDESC3 : TCmDbField;
    FDESC4 : TCmDbField;
    FDESC5 : TCmDbField;
}
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    property idhstasmed: TCmDbField read Fidhstasmed write Fidhstasmed;
    property idmotivo: TCmDbField read Fidmotivo write Fidmotivo;
    property TipoAcidTransito: TCmDbField read FTipoAcidTransito write FTipoAcidTransito;
    property DtAso: TCmDbField read FDtAso write FDtAso;
    property TipoAso: TCmDbField read FTipoAso write FTipoAso;

    //Everson Cunha - SIG38475 - Ini
    //property CodProcedMedTuss: TCmDbField read FCodProcedMedTuss write FCodProcedMedTuss;
    //property CodCnes: TCmDbField read FCodCnes write FCodCnes;
    //property Contato: TCmDbField read FContato write FContato;
    //property Email: TCmDbField read FEmail write FEmail;
    //property FlgAlteraMotivo: TCmDbField read FFlgAlteraMotivo write FFlgAlteraMotivo;
    //property FlgEfeitoRetro: TCmDbField read FFlgEfeitoRetro write FFlgEfeitoRetro;
    //property IdAtestadoAnt: TCmDbField read FIdAtestadoAnt write FIdAtestadoAnt;
    //Everson Cunha - SIG38475 - Fim
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204

    //Cássio Rovaroto - SIG nº 38475.60437 - Início
    property FlgAfastAnterior: TCmDbField read FFlgAfastAnterior write FFlgAfastAnterior;
    property OrigemRet: TCmDbField read FOrigemRet write FOrigemRet;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    //Cássio Rovaroto - SIG nº 38475.60437 - Fim
    property dt_validade_aso: TCmDbField read Fdt_validade_aso write Fdt_validade_aso; //Everson Cunha - SIG134234
  end;

implementation

{ TDbHstAsMed }

constructor TDbHstAsMed.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTASMED';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FCodTipoOcMed := CreateCmDbField('CODTIPOOCMED',ftFloat,True,True,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FIdExaminador := CreateCmDbField('IDEXAMINADOR',ftFloat,false,false,false,true,'');
  FExaminador := CreateCmDbField('EXAMINADOR',ftString,false,false,false,true,'');
  FDataPlan := CreateCmDbField('DATAPLAN',ftDateTime,false,false,false,true,'',-1,true);
  FDataReal := CreateCmDbField('DATAREAL',ftDateTime,false,false,false,true,'');
  FCodCID := CreateCmDbField('CODCID',ftString,false,false,false,true,'');
  FAvaliacao := CreateCmDbField('AVALIACAO',ftFloat,false,false,false,true,'');
  FLicenca := CreateCmDbField('LICENCA',ftFloat,false,false,false,true,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftBlob,false,false,false,true,'');
// Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  {FCODPTCORPESOCIAL := CreateCmDbField('CODPTCORPESOCIAL',ftFloat,false,false,false,true,'');
  FCODAGTESOCIAL := CreateCmDbField('CODAGTESOCIAL',ftFloat,false,false,false,true,'');
  FCODSDOENCAESOCIAL := CreateCmDbField('CODSDOENCAESOCIAL',ftFloat,false,false,false,true,'');
  FCODSTESOCIAL := CreateCmDbField('CODSTESOCIAL',ftFloat,false,false,false,true,'');
  FCODNTESOCIAL := CreateCmDbField('CODNTESOCIAL',ftFloat,false,false,false,true,''); }
// Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  {FDESC1 := CreateCmDbField('FDESC1',ftInteger,false,false,false,true,'');
  FDESC2 := CreateCmDbField('FDESC2',ftInteger,false,false,false,true,'');
  FDESC3 := CreateCmDbField('FDESC3',ftInteger,false,false,false,true,'');
  FDESC4 := CreateCmDbField('FDESC4',ftInteger,false,false,false,true,'');
  FDESC5 := CreateCmDbField('FDESC5',ftInteger,false,false,false,true,'');}

  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  Fidhstasmed := CreateCmDbField('IDHSTASMED',ftFloat,True,True,false,true,'');
  Fidmotivo := CreateCmDbField('IDMOTIVO',ftFloat,false,false,false,true,'');
  FTipoAcidTransito := CreateCmDbField('TIPOACIDTRANSITO',ftString,false,false,false,true,'');
  FDtAso := CreateCmDbField('DTASO',ftDateTime,false,false,false,true,'');
  FTipoAso := CreateCmDbField('TIPOASO',ftString,false,false,false,true,'');

  //Everson Cunha - SIG38475 - Ini
  //FCodProcedMedTuss := CreateCmDbField('CODPROCEDMEDTUSS',ftFloat,false,false,false,true,'');
  //FOrgaoClasse := CreateCmDbField('ORGAOCLASSE',ftString,false,false,false,true,'');
  //FCodCnes := CreateCmDbField('CODCNES',ftFloat,false,false,false,true,'');
  //FContato := CreateCmDbField('CONTATO',ftString,false,false,false,true,'');
  //FEmail := CreateCmDbField('EMAIL',ftString,false,false,false,true,'');
  //FFlgAlteraMotivo := CreateCmDbField('FLGALTERAMOTIVO',ftString,false,false,false,true,'');
  //FFlgEfeitoRetro := CreateCmDbField('FLGEFEITORETRO',ftString,false,false,false,true,'');
  //FIdAtestadoAnt := CreateCmDbField('IDATESTADOANT',ftFloat,false,false,false,true,''); {}
  //Everson Cunha - SIG38475 - Fim
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204

  //Cássio Rovaroto - SIG nº 38475.60437 - Início
  FFlgAfastAnterior := CreateCmDbField('FLGAFASTANTERIOR', ftString, false, false, false, false, '');
  FOrigemRet := CreateCmDbField('ORIGEMRET', ftString, false, false, false, false, '');
  FIdProcesso := CreateCmDbField('IDPROCESSO', ftFloat, false, false, false, false, '');
  //Cássio Rovaroto - SIG nº 38475.60437 - Fim
  Fdt_validade_aso := CreateCmDbField('DT_VALIDADE_ASO',ftDateTime,false,false,false,true,''); //Everson Cunha - SIG134234
end;

end.
