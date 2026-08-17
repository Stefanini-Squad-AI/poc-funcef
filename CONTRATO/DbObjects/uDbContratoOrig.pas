{-------------------------------------------------------------------------------
-----------------------ALTERAÇÕES / IMPLEMENTAÇÕES -----------------------------
--------------------------------------------------------------------------------
N.WO............: WO13506
Data............: 12/11/2024      
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de novo campo: JUSTIFOPCAONAOSEAPLICA, que será
                  usado no Cadastro de Contratos.
--------------------------------------------------------------------------------
 N. SIG..........: 137142
 Data............: 05/09/2023
 Responsável.....: Luis Ferrari
 Descrição.......: Inclusão do flag de Tipo de contratação e identificador do contrato
--------------------------------------------------------------------------------
 N. SIG..........: 121621
 Data............: 25/02/2022
 Responsável.....: Luis Ferrari
 Descrição.......: VALORBASECONTRATO transformado em  false
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
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 03/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbContratoOrig;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratoOrig = class(TCmDbObject)

  private
    FDatabasecontrato: TCmDbField;
    FFlgfimcontrato: TCmDbField;
    FIdtelefone: TCmDbField;
    FDataefetencerra: TCmDbField;
    FIdaditamento: TCmDbField;
    FMotivoencerra: TCmDbField;
    FIdpessoa: TCmDbField;
    FRenovacao: TCmDbField;
    FIdcontrato: TCmDbField;
    FCodtipdoc: TCmDbField;
    FNomecontrato: TCmDbField;
    FDataassinatura: TCmDbField;
    FTipocontrato: TCmDbField;
    FCodcontratoempr: TCmDbField;
    FIdendcorrespon: TCmDbField;
    FValorbasecontrato: TCmDbField;
    FAviso: TCmDbField;
    FCodportforma: TCmDbField;
    FDescricaocontrato: TCmDbField;
    FIdresponsavel: TCmDbField;
    FIdtipoprocessorad: TCmDbField;
    FFlgempenho: TCmDbField;
    FIdreservaorcamen: TCmDbField;
    //FCodauxcontrato: TCmDbField; //Everson Cunha - SIG46231
    FUnidnegoc: TCmDbField;
    FObservacao: TCmDbField;
    FIdforcli: TCmDbField;
    FMoecodigo: TCmDbField;
    FPrazodenuncia: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdendcobranca: TCmDbField;
    FIdcontato: TCmDbField;
    FDataprevencerra: TCmDbField;
    FIdendentrega: TCmDbField;
    FDataInicio: TCmDbField;
    FValor_Orcado: TCmDbField;
    FData_Ultima_Cotacao: TCmDbField;
    FFlgTipoValorBase: TCmDbField; //Everson Cunha - SIG50897
    FId_Tipo_servico: TCmDbField;
    FFlgDistrato: TCmDbField;
    FFlgTpVlrOrcadoAprovado: TCmDbField;
    FFlgContratacao: TCmDbField;     // sig 137142 Ferrari
    FIdentificador: TCmDbField;      // sig 137142 Ferrari

    FJustOpcaoNaoSeAplica: TCmDbField; // Paulo Nobre - WO13506

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

     // Paulo Nobre - WO13506 - Inicio
     Property JustOpcaoNaoSeAplica : TCmDbField read FJustOpcaoNaoSeAplica write FJustOpcaoNaoSeAplica;
     // Paulo Nobre - WO13506 - Fim
     
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratoOrig }

constructor TDbContratoOrig.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATOORIG';
  //Inicio - Luis Ferrari
  // fValorbasecontrato := CreateCmDbField('VALORBASECONTRATO',ftfloat,False,False,False,True,'');
   fValorbasecontrato := CreateCmDbField('VALORBASECONTRATO',ftfloat,False,False,False,False,'');
  //Fim 
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTipocontrato := CreateCmDbField('TIPOCONTRATO',ftString,True,False,False,True,'');
   fRenovacao := CreateCmDbField('RENOVACAO',ftString,False,False,False,True,'');
   fPrazodenuncia := CreateCmDbField('PRAZODENUNCIA',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
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
   fDescricaocontrato := CreateCmDbField('DESCRICAOCONTRATO',ftString,False,False,False,True,'');
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

   // Paulo Nobre - WO13506 - Inicio
   FJustOpcaoNaoSeAplica := CreateCmDbField('JUSTIFOPCAONAOSEAPLICA',ftString,False,False,False,True,'');
   // Paulo Nobre - WO13506 - Fim

end;

function TDbContratoOrig.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

end.



