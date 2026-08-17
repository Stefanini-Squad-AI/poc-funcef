{-------------------------------------------------------------------------------
-----------------------ALTERAÇÕES / IMPLEMENTAÇÕES -----------------------------
--------------------------------------------------------------------------------
N.WO............: WO28052
Data............: 01/12/2025
Responsável.....: Paulo Nobre
Descrição.......: Troca do tipo de campo de ftBlob para ftString.
--------------------------------------------------------------------------------
N.WO............: WO28020
Data............: 02/12/2025
Responsável.....: Paulo Nobre
Descrição.......: Mesmo fonte que foi disponibilizado no WO28052. Nesta versão
                  não foi preciso ajustes.
--------------------------------------------------------------------------------
N.WO............: WO20717
Data............: 02/04/2025
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de novos campos:
                    .FLGSERVICOPONTUAL
                    .FLGSERVICOCONTINUADO
--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 05/12/2024
Responsável.....: Paulo Nobre
Descrição.......: Criação do campo FLGSALDOTRANSFERIDO - Identifica se o
                  contrato teve seu saldo transferido para outro.
--------------------------------------------------------------------------------
N.WO............: WO13506     
Data............: 12/11/2024
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de novo campo: JUSTIFOPCAONAOSEAPLICA, que será
                  usado no Cadastro de Contratos.
--------------------------------------------------------------------------------
Rotina..........:
Atender.........: WO10498
Data............: 10/05/2024
Responsável.....: Luis Ferrari
Descrição.......: Incluir Flag Vigencia Indeterminada para desobrigar a data prevista de encerramento do contrato
--------------------------------------------------------------------------------
 N. WO...........: WO10578
 Data............: 09/05/2024
 Responsável.....: Helen V Bianchi
 Descrição.......: Inclusão do FLGFASE_ENCERRAMENTO e RESPFASE_ENCERRAMENTO
--------------------------------------------------------------------------------
 N. SIG..........: 137142
 Data............: 05/09/2023
 Responsável.....: Luis Ferrari
 Descrição.......: Inclusão do flag de Tipo de contratação e identificador do contrato
--------------------------------------------------------------------------------
 N. SIG..........: 114705
 Data............: 19/08/2021
 Responsável.....: Everson Cunha
 Descrição.......: FLG_TP_VLR_ORCADO_APROVADO
--------------------------------------------------------------------------------
 N. SIG..........: 101877
 Data............: 02/12/2020
 Responsável.....: Everson Cunha
 Descrição.......: ID_TIPO_SERVICO / FLGDISTRATO
--------------------------------------------------------------------------------
 N. SIG..........: 50897
 Data............: 06/12/2019
 Responsável.....: Everson Cunha
 Descrição.......: FLGTIPOVALORBASE
--------------------------------------------------------------------------------
 N. SIG..........: 46231
 Data............: 27/08/2019
 Responsável.....: Everson Cunha
 Descrição.......: Incluído: DATA_ULTIMA_COTACAO / VALOR_ORCADO.
                   Excluído: CODAUXCONTRATO.
--------------------------------------------------------------------------------
 N. Sol..........: 242313/17289
 N. PPM..........: 828977
 Data............: 19/06/2015
 Responsável.....: Felipe A. Santos
 Descrição.......: campo FLGANS.
--------------------------------------------------------------------------------
 N. Sol..........: 218909/16724
 N. PPM..........: 588170
 Data............: 20/02/2015
 Responsável.....: Felipe A. Santos
 Descrição.......: Criação dos campos flag e período referente ao controle
                   alerta de medição.
--------------------------------------------------------------------------------
 N. Sol..........: 200730
 N. Kintana......: 1940118
 Data............: 20/02/2013
 Responsável.....: Thiago Melo
 Descrição.......: Erro Ao tentar informar o aditamento do contrato com
      		         determinada Empresa;
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Claudio Beraldo da Silva        }
{ Atualizado Em: 03/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbContratoContr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratoContr = class(TCmDbObject)

  private
    FFlgfimcontrato: TCmDbField;
    FDescricaocontrato: TCmDbField;
    FDataassinatura: TCmDbField;
    FDataprevencerra: TCmDbField;
    FAviso: TCmDbField;
    FMotivoencerra: TCmDbField;
    FDataefetencerra: TCmDbField;
    FIdaditamento: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdendcobranca: TCmDbField;
    FObservacao: TCmDbField;
    FFlgempenho: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdendentrega: TCmDbField;
    FIdforcli: TCmDbField;
    FIdtipoprocessorad: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FDatabasecontrato: TCmDbField;
    FIdcontato: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodportforma: TCmDbField;
    FValorbasecontrato: TCmDbField;
    FPrazodenuncia: TCmDbField;
    FIdreservaorcamen: TCmDbField;
    FTipocontrato: TCmDbField;
    FCodcontratoempr: TCmDbField;
    FIdresponsavel: TCmDbField;
    FIdtelefone: TCmDbField;
    FNomecontrato: TCmDbField;
    FRenovacao: TCmDbField;
    //FCodauxcontrato: TCmDbField; //Everson Cunha - SIG46231
    FIdendcorrespon: TCmDbField;
    FCodtipdoc: TCmDbField;
    FIdcontrato: TCmDbField;
    FDataInicio: TCmDbField;
    FIdProcessoRAD: TCmDbField;
    FFlgRenovacao: TCmDbField;
    FRespRenovacao: TCmDbField;
    FAvisoMedicao: TCmDbField;    // Felipe A. Santos - SOL218909/16724 PPM 588170
    FFlgAvisoMedicao: TCmDbField; // Felipe A. Santos - SOL218909/16724 PPM 588170
    FFlgANS: TCmDbField;          // Felipe A. Santos SOL 242313/17289 PPM 828977
    FValor_Orcado: TCmDbField;
    FData_Ultima_Cotacao: TCmDbField;
    FFlgTipoValorBase: TCmDbField; //Everson Cunha - SIG50897
    FId_Tipo_servico: TCmDbField;
    FFlgDistrato: TCmDbField;
    FFlgTpVlrOrcadoAprovado: TCmDbField;
    FFlgContratacao: TCmDbField;     // sig 137142 Ferrari
    FIdentificador: TCmDbField;      // sig 137142 Ferrari
    FFlgVigenciaIndeterminada: TCmDbField;     // WO10498 Ferrari
    FFlgFase_Encerramento: TCmDbField;  // WO10578 Helen
    FRespFase_Encerramento: TCmDbField; // WO10578 Helen
    FJustOpcaoNaoSeAplica: TCmDbField; // Paulo Nobre - WO13506
    FFlgSaldoTransferido: TCmDbField;      // Paulo Nobre -  WO15750

    // Paulo Nobre -  WO20717 - Inicio
    FFlgServicoPontual : TCmDbField;
    FFlgServicoContinuado : TCmDbField;
    // Paulo Nobre -  WO20717 - Fim

  public
     Property Valorbasecontrato: TCmDbField read FValorbasecontrato write FValorbasecontrato;
     Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
     Property Tipocontrato: TCmDbField read FTipocontrato write FTipocontrato;
     Property Renovacao: TCmDbField read FRenovacao write FRenovacao;
     Property Prazodenuncia: TCmDbField read FPrazodenuncia write FPrazodenuncia;
     Property Observacao: TCmDbField read FObservacao write FObservacao;
     Property Nomecontrato: TCmDbField read FNomecontrato write FNomecontrato;
     Property Motivoencerra: TCmDbField read FMotivoencerra write FMotivoencerra;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Idtipoprocessorad: TCmDbField read FIdtipoprocessorad write FIdtipoprocessorad;
     Property Idtelefone: TCmDbField read FIdtelefone write FIdtelefone;
     Property Idresponsavel: TCmDbField read FIdresponsavel write FIdresponsavel;
     Property Idreservaorcamen: TCmDbField read FIdreservaorcamen write FIdreservaorcamen;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write FIdforcli;
     Property Idendentrega: TCmDbField read FIdendentrega write FIdendentrega;
     Property Idendcorrespon: TCmDbField read FIdendcorrespon write FIdendcorrespon;
     Property Idendcobranca: TCmDbField read FIdendcobranca write FIdendcobranca;
     Property Idcontrato: TCmDbField read FIdcontrato write FIdcontrato;
     Property Idcontato: TCmDbField read FIdcontato write FIdcontato;
     Property Idaditamento: TCmDbField read FIdaditamento write FIdaditamento;
     Property Flgfimcontrato: TCmDbField read FFlgfimcontrato write FFlgfimcontrato;
     Property Flgempenho: TCmDbField read FFlgempenho write FFlgempenho;
     Property Descricaocontrato: TCmDbField read FDescricaocontrato write FDescricaocontrato;
     Property Dataprevencerra: TCmDbField read FDataprevencerra write FDataprevencerra;
     Property Dataefetencerra: TCmDbField read FDataefetencerra write FDataefetencerra;
     Property Databasecontrato: TCmDbField read FDatabasecontrato write FDatabasecontrato;
     Property Dataassinatura: TCmDbField read FDataassinatura write FDataassinatura;
     Property Codtipdoc: TCmDbField read FCodtipdoc write FCodtipdoc;
     Property Codportforma: TCmDbField read FCodportforma write FCodportforma;
     Property Codcontratoempr: TCmDbField read FCodcontratoempr write FCodcontratoempr;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;
     //Property Codauxcontrato: TCmDbField read FCodauxcontrato write FCodauxcontrato; //Everson Cunha - SIG46231
     Property Aviso: TCmDbField read FAviso write FAviso;
     Property DataInicio: TCmDbField read FDataInicio write FDataInicio;
     Property IdProcessoRAD: TCmDbField read FIdProcessoRAD write FIdProcessoRAD;
     Property FlgRenovacao : TCmDbField  read FFlgRenovacao write FFlgRenovacao;   // Edilaine - SOL 168270 / KTN 1481496
     Property RespRenovacao : TCmDbField read FRespRenovacao write FRespRenovacao; // Edilaine - SOL 168270 / KTN 1481496

     // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
     Property FlgAvisoMedicao :  TCmDbField read FFlgAvisoMedicao write FFlgAvisoMedicao;
     Property AvisoMedicao :  TCmDbField read FAvisoMedicao write FAvisoMedicao;
     // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

     Property FlgANS : TCmDbField read FFlgANS write FFlgANS; // Felipe A. Santos SOL 242313/17289 PPM 828977

     //Everson Cunha - SIG46231 - Início
     Property Data_Ultima_Cotacao : TCmDbField read FData_Ultima_Cotacao write FData_Ultima_Cotacao;
     Property Valor_Orcado : TCmDbField read FValor_Orcado write FValor_Orcado;
     //Everson Cunha - SIG46231 - Fim

     //Everson Cunha - SIG101877 - Ini
     Property Id_Tipo_servico : TCmDbField read FId_Tipo_servico write FId_Tipo_servico;
     Property FlgDistrato : TCmDbField read FFlgDistrato write FFlgDistrato;
     //Everson Cunha - SIG101877 - Fim

     Property FlgTipoValorBase : TCmDbField read FFlgTipoValorBase write FFlgTipoValorBase; //Everson Cunha - SIG50897
     Property FlgTpVlrOrcadoAprovado : TCmDbField read FFlgTpVlrOrcadoAprovado write FFlgTpVlrOrcadoAprovado; //Everson Cunha - SIG114705

     // SIG 137142 Inicio Ferrari
     Property FlgContratacao : TCmDbField read FFlgContratacao write FFlgContratacao;
     Property Identificador : TCmDbField read FIdentificador write FIdentificador;
     // SIG 137142 Fim Ferrari
     Property FlgVigenciaIndeterminada : TCmDbField read FFlgVigenciaIndeterminada write FFlgVigenciaIndeterminada;      // WO10498 Ferrari

     //Helen - WO10578 - Ini
     Property FlgFase_Encerramento : TCmDbField read FFlgFase_Encerramento write FFlgFase_Encerramento;
     Property RespFase_Encerramento : TCmDbField read FRespFase_Encerramento write FRespFase_Encerramento;
     //Helen - WO10578 - Fim

     // Paulo Nobre - WO13506 - Inicio
     Property JustOpcaoNaoSeAplica : TCmDbField read FJustOpcaoNaoSeAplica write FJustOpcaoNaoSeAplica;
     // Paulo Nobre - WO13506 - Fim

     property FlgSaldoTransferido : TCmDbField read FFlgSaldoTransferido write FFlgSaldoTransferido; // Paulo Nobre -  WO15750

     // Paulo Nobre - WO20717 - Inicio
     Property FlgServicoPontual : TCmDbField read FFlgServicoPontual write FFlgServicoPontual;
     Property FlgServicoContinuado : TCmDbField read FFlgServicoContinuado write FFlgServicoContinuado;
     // Paulo Nobre - WO20717 - Fim

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratoContr }

constructor TDbContratoContr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATOCONTR';

   fValorbasecontrato := CreateCmDbField('VALORBASECONTRATO',ftfloat,False,False,False,False,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTipocontrato := CreateCmDbField('TIPOCONTRATO',ftString,True,False,False,True,'');

   // Paulo Nobre - WO28052 - Inicio

   // Thiago Melo  SOL 200730 KINTANA 1940118 INI

//   fRenovacao := CreateCmDbField('RENOVACAO',ftBlob,False,False,False,True,'');
   fRenovacao := CreateCmDbField('RENOVACAO',ftString,False,False,False,True,'');

//   fRenovacao := CreateCmDbField('RENOVACAO',ftString,False,False,False,True,'');
   // Thiago Melo  SOL 200730 KINTANA 1940118 FIM

   // Paulo Nobre - WO28052 - Fim

   fPrazodenuncia := CreateCmDbField('PRAZODENUNCIA',ftfloat,False,False,False,True,'');

   // Paulo Nobre - WO28052 - Inicio

//   fObservacao := CreateCmDbField('OBSERVACAO',ftBlob,False,False,False,True,''); // Daniel Simões - P: 22039 - 10/04/2006
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   
   // Paulo Nobre - WO28052 - Fim

   fNomecontrato := CreateCmDbField('NOMECONTRATO',ftString,False,False,False,True,'');
   fMotivoencerra := CreateCmDbField('MOTIVOENCERRA',ftString,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,False,False,True,'');
   fIdtipoprocessorad := CreateCmDbField('IDTIPOPROCESSORAD',ftfloat,False,False,False,True,'');
   fIdtelefone := CreateCmDbField('IDTELEFONE',ftfloat,False,False,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdreservaorcamen := CreateCmDbField('IDRESERVAORCAMEN',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdendentrega := CreateCmDbField('IDENDENTREGA',ftfloat,False,False,False,True,'');
   fIdendcorrespon := CreateCmDbField('IDENDCORRESPON',ftfloat,False,False,False,True,'');
   fIdendcobranca := CreateCmDbField('IDENDCOBRANCA',ftfloat,False,False,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'');
   fIdcontato := CreateCmDbField('IDCONTATO',ftfloat,False,False,False,True,'');
   fIdaditamento := CreateCmDbField('IDADITAMENTO',ftfloat,False,False,False,True,'');
   fFlgfimcontrato := CreateCmDbField('FLGFIMCONTRATO',ftString,False,False,False,True,'');
   fFlgempenho := CreateCmDbField('FLGEMPENHO',ftString,False,False,False,True,'');

   // Paulo Nobre - WO28052 - Inicio

//   fDescricaocontrato := CreateCmDbField('DESCRICAOCONTRATO',ftBlob,False,False,False,True,''); // Daniel Simões - P: 22039 - 10/04/2006
   fDescricaocontrato := CreateCmDbField('DESCRICAOCONTRATO',ftString,False,False,False,True,'');

   // Paulo Nobre - WO28052 - Fim

   fDataprevencerra := CreateCmDbField('DATAPREVENCERRA',ftDateTime,False,False,False,True,'');
   fDataefetencerra := CreateCmDbField('DATAEFETENCERRA',ftDateTime,False,False,False,True,'');
   fDatabasecontrato := CreateCmDbField('DATABASECONTRATO',ftDateTime,False,False,False,True,'');
   fDataassinatura := CreateCmDbField('DATAASSINATURA',ftDateTime,True,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodcontratoempr := CreateCmDbField('CODCONTRATOEMPR',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   //fCodauxcontrato := CreateCmDbField('CODAUXCONTRATO',ftString,False,False,False,True,''); //Everson Cunha - SIG46231
   fAviso := CreateCmDbField('AVISO',ftfloat,False,False,False,True,'');
   fDataInicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
   fIdProcessoRAD := CreateCmDbField('IDPROCESSORAD',ftfloat,False,False,False,True,'');
   fFlgRenovacao := CreateCmDbField('FLGRENOVACAO',ftString,False,False,False,True,''); // Edilaine - SOL 168270 / KTN 1481496
   fRespRenovacao := CreateCmDbField('RESPRENOVACAO',ftString,False,False,False,True,''); // Edilaine - SOL 168270 / KTN 1481496

   // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
   fFlgAvisoMedicao := CreateCmDbField('FLGAVISOMEDICAO',ftFloat,False,False,False,False,'');
   fAvisoMedicao := CreateCmDbField('AVISOMEDICAO',ftFloat,False,False,False,True,'');
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

   FFlgANS := CreateCmDbField('FLGANS', ftString, False, False, False, False, ''); // Felipe A. Santos SOL 242313/17289 PPM 828977

   //Everson Cunha - SIG46231 - Início
   FData_Ultima_Cotacao := CreateCmDbField('DATA_ULTIMA_COTACAO',ftDateTime,False,False,False,True,'');
   FValor_Orcado := CreateCmDbField('VALOR_ORCADO',ftFloat,False,False,False,False,'');
   //Everson Cunha - SIG46231 - Fim

   //Everson Cunha - SIG101877 - Ini
   FId_Tipo_servico := CreateCmDbField('ID_TIPO_SERVICO', ftfloat, False, False, False, True, '');
   FFlgDistrato := CreateCmDbField('FLGDISTRATO', ftString, False, False, False, True, '');
   //Everson Cunha - SIG101877 - Fim

   FFlgTipoValorBase := CreateCmDbField('FLGTIPOVALORBASE',ftString,False,False,False,True,''); //Everson Cunha - SIG50897
   FFlgTpVlrOrcadoAprovado := CreateCmDbField('FLG_TP_VLR_ORCADO_APROVADO',ftString,False,False,False,True,''); //Everson Cunha - SIG114705

   // SIG 137142 Inicio Ferrari
   FFlgContratacao := CreateCmDbField('FLGCONTRATACAO',ftString,False,False,False,True,'');
   FIdentificador := CreateCmDbField('IDENTIFICADOR',ftString,False,False,False,True,'');
   // SIG 137142 Fim Ferrari
   FFlgVigenciaIndeterminada := CreateCmDbField('FLGVIGENCIAINDETERMINADA',ftString,False,False,False,True,'');    // WO10498 Ferrari

   //Helen - WO10578 - Ini
   FFlgFase_Encerramento:= CreateCmDbField('FLGFASE_ENCERRAMENTO',ftString,False,False,False,True,'');
   FRespFase_Encerramento := CreateCmDbField('RESPFASE_ENCERRAMENTO',ftString,False,False,False,True,'');
   //Helen - WO10578 - Fim

   // Paulo Nobre - WO13506 - Inicio
   FJustOpcaoNaoSeAplica := CreateCmDbField('JUSTIFOPCAONAOSEAPLICA',ftString,False,False,False,True,'');
   // Paulo Nobre - WO13506 - Fim

   FFlgSaldoTransferido := CreateCmDbField('FLGSALDOTRANSFERIDO',ftString,False,False,False,True,''); // Paulo Nobre -  WO15750

   // Paulo Nobre - WO20717 - Inicio
   FFlgServicoPontual := CreateCmDbField('FLGSERVICOPONTUAL',ftString,False,False,False,True,'');
   FFlgServicoContinuado := CreateCmDbField('FLGSERVICOCONTINUADO',ftString,False,False,False,True,'');
   // Paulo Nobre - WO20717 - Fim

end;

function TDbContratoContr.Insert: Boolean;
begin
   fIdcontrato.AsFloat := GetSequence('CONTRATOCONTR');
   Result := Inherited Insert;
end;

end.



