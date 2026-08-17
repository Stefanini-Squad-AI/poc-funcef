{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit FCadLayoutOrcMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, Db, wwdblook, StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ppComm, ppCache,
  ppDB, ppDBBDE, ppEndUsr, Menus, ppReport, ppForms, ppProd, ppClass,
  ppPrnabl, ppCtrls, ppBands, Pptypes,  ppDsgnCt, ppUtils, ppSubRpt,
  ppRuler, ppViewr, ppRegion, ppPrintr, ppTmplat, Printers, ComCtrls,
  ppRelatv, ppDBPipe, CmEventosCadastro, ImgList, ppModule, daDataModule,
  DBClient, uCMClientDataSet, uCtrlCadLayOutOrc, uCMTypes, FAguarde;

Type
  TfrmCadLayoutOrcMT = class(TFrmCadastroMT)
    Label4: TLabel;
    btnDesenho: TBitBtn;
    dbcboTipo: TwwDBComboBox;
    Label1: TLabel;
    dblkRelatorio: TwwDBLookupCombo;
    dbeNome: TwwDBEdit;
    Label2: TLabel;
    DsgnCM: TppDesigner;
    ppRelatorio: TppBDEPipeline;
    DsConsulta: TwwDataSource;
    MergeMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFileSave: TMenuItem;
    mniFileLine3: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    mniFileLine4: TMenuItem;
    mniFilePrint: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    MnuRlatorio: TMenuItem;
    MnuTitulo: TMenuItem;
    MnuSumario: TMenuItem;
    N2: TMenuItem;
    MnuCabecalho: TMenuItem;
    MnuRodape: TMenuItem;
    N3: TMenuItem;
    MnuGrupos: TMenuItem;
    MnuLInha: TMenuItem;
    MnuRetrato: TMenuItem;
    MnuPaisagem: TMenuItem;
    N5: TMenuItem;
    MnuUnidades: TMenuItem;
    MnuPixelsTela: TMenuItem;
    MnuPixelsImpressora: TMenuItem;
    MnuPolegada: TMenuItem;
    MnuMilimetros: TMenuItem;
    MnuMMilimetros: TMenuItem;
    MemReports: TMemo;
    memLog: TRichEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    DsqDemoColMes: TwwDataSource;
    ppDemoColMes: TppBDEPipeline;
    ppConsulta: TppBDEPipeline;
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    NomeCampo: TMemo;
    DscCampo: TMemo;
    CdsReports: TCMClientDataSet;
    CdsRelatorio: TCMClientDataSet;
    CdsDemoColMes: TCMClientDataSet;
    CdsDemoNormal: TCMClientDataSet;

    {Procedimentos Definidos}
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);


    Procedure FormShow(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure btnDesenhoClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure mniFileSaveClick(Sender: TObject);
    Procedure Sair1Click(Sender: TObject);
    Procedure mniFilePageSetupClick(Sender: TObject);
    Procedure mniFilePrintClick(Sender: TObject);
    Procedure mniFilePrintToFileSetupClick(Sender: TObject);
    Procedure DsgnCMCreate(Sender: TObject);

    Function procuramemo(ch : String) : String;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);

  Private
    { Private declarations }
    iIndice: LongInt;
    bCriaTemplate: Boolean;

    CtrlCadLayOutOrc : TCtrlCadLayOutOrc;
  Public
    { Public declarations }
  End;

Var
  frmCadLayoutOrcMT: TfrmCadLayoutOrcMT;

Implementation
Uses uModeloRelatCM, UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo;

{$R *.DFM}
//************************************************
Procedure TfrmCadLayoutOrcMT.FormCreate(Sender: TObject);
var x : integer;
Begin
  frmAguarde.Mostra( 'Iniciando' );
  Inherited;

  ModeloRelatCM    := TModeloRelatCM.Create;

  CtrlCadLayOutOrc := TCtrlCadLayOutOrc.Create;
  CtrlCadLayOutOrc.Initialize( DtmBaseDados.dbBaseDados, True,
                               Sistema.ConnectionType,   Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlCadLayOutOrc.Cds           := Cds;
  CtrlCadLayOutOrc.CdsReports    := CdsReports;
  CtrlCadLayOutOrc.CdsRelatorio  := CdsRelatorio;
  CtrlCadLayOutOrc.CdsDemoNormal := CdsDemoNormal;

  NomeCampo.Lines.clear;
  DscCampo.Lines.clear;

  NomeCampo.Lines.Add(UpperCase('SaldoRealPerEAT'));
  DscCampo.Lines.Add('Vlr Real no Per - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('SaldoOrcPerEAT'));
  DscCampo.Lines.Add('Vlr Orç no Per - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('DifOrcRealPerEAT'));
  DscCampo.Lines.Add('Dif Orç x Real Per - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AV_RealPerEAT'));
  DscCampo.Lines.Add('Ana Ve Vlr Real Per - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AV_OrcPerEAT'));
  DscCampo.Lines.Add('Ana Ve Vlr Orç Per - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AH_OrcRealPerEAT'));
  DscCampo.Lines.Add('Ana Ho Orç x Real Per-Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('SaldoRealAcumEAT'));
  DscCampo.Lines.Add('Vlr Real Acum - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('SaldoOrcAcumEAT'));
  DscCampo.Lines.Add('Vlr Orç Acum - Exercício Atu');
  NomeCampo.Lines.Add(UpperCase('DifOrcRealAcumEAT'));
  DscCampo.Lines.Add('Dif Orç x Real Acum - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AV_RealAcumEAT'));
  DscCampo.Lines.Add('Ana Ve Vlr Real Acum - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AV_OrcAcumEAT'));
  DscCampo.Lines.Add('Ana Ve Vlr Orç Acum - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AH_OrcRealAcumEAT'));
  DscCampo.Lines.Add('Ana Ho Orç x Real Acum-Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('SaldoRealPerEAN'));
  DscCampo.Lines.Add('Vlr Real no Per - Exerc Ant');
  NomeCampo.Lines.Add(UpperCase('DifExAtuAntPer'));
  DscCampo.Lines.Add('Dif Exerc Atu x Exerc Ant Per');
  NomeCampo.Lines.Add(UpperCase('AV_RealPerEAN'));
  DscCampo.Lines.Add('Ana Ve Vlr Real no Per - Exerc Ant');
  NomeCampo.Lines.Add(UpperCase('AH_ExAtuAntPer'));
  DscCampo.Lines.Add('Ana Ho Exerc Atu x Exerc Ant Per');
  NomeCampo.Lines.Add(UpperCase('SaldoRealAcumEAN'));
  DscCampo.Lines.Add('Vlr Real Acum - Exerc Anterior');
  NomeCampo.Lines.Add(UpperCase('DifExAtuAntAcum'));
  DscCampo.Lines.Add('Dif Exerc Atu x Exerc Anterior Acum');
  NomeCampo.Lines.Add(UpperCase('AV_RealAcumEAN'));
  DscCampo.Lines.Add('Ana Ve Vlr Real Acum - Exerc Ant');
  NomeCampo.Lines.Add(UpperCase('AH_ExAtuAntAcum'));
  DscCampo.Lines.Add('Ana Ho Exerc Atu x Exerc Ant Acum');
  NomeCampo.Lines.Add(UpperCase('SaldoReaPerAntEAT'));
  DscCampo.Lines.Add('Vlr Real no Período Ant - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('DifPerAtuAntEAT'));
  DscCampo.Lines.Add('Dif Per Atu x Per Ant - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AV_RealPerAntEAT'));
  DscCampo.Lines.Add('Ana Ve Vlr Real Per Ant - Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('AH_PerAtuAntEAT'));
  DscCampo.Lines.Add('Ana Ho Per Atu x Per Ant-Exerc Atu');
  NomeCampo.Lines.Add(UpperCase('FlagTipoNegativo'));
  DscCampo.Lines.Add('Flag de Cálculo Interna (não usar)');
  NomeCampo.Lines.Add(UpperCase('NomeContaInd'));
  DscCampo.Lines.Add('Nome da Conta Orçamentária Indentada');
  NomeCampo.Lines.Add(UpperCase('NomeConta'));
  DscCampo.Lines.Add('Nome da Conta Orçamentária');
  NomeCampo.Lines.Add(UpperCase('NumLinha'));
  DscCampo.Lines.Add('Número da Linha do Relatório');
  NomeCampo.Lines.Add(UpperCase('CodigoConta'));
  DscCampo.Lines.Add('Código da Conta Orçamentária');
  NomeCampo.Lines.Add(UpperCase('CodigoConta100'));
  DscCampo.Lines.Add('Código da Conta Orçamentária para 100%');
  NomeCampo.Lines.Add(UpperCase('Indentacao'));
  DscCampo.Lines.Add('Indentação da Conta (não usar)');
  NomeCampo.Lines.Add(UpperCase('NumDecimais'));
  DscCampo.Lines.Add('Nº casas decimais para exibição (não usar)');
  NomeCampo.Lines.Add(UpperCase('FlagMonetaria'));
  DscCampo.Lines.Add('Flag indic se a Conta é Monetária ou não');
  NomeCampo.Lines.Add(UpperCase('FlagInterna1'));
  DscCampo.Lines.Add('Flag de Cálculo Interna (não usar)');
  NomeCampo.Lines.Add(UpperCase('Linha1'));
  DscCampo.Lines.Add('Flag indic Espaço entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Linha2'));
  DscCampo.Lines.Add('Flag indic Linha Fina entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Linha3'));
  DscCampo.Lines.Add('Flag indic Linha Grossa entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Linha4'));
  DscCampo.Lines.Add('Flag indic Linha Dupla entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Periodo'));
  DscCampo.Lines.Add('Per inicial dos Parâmetros do Relatório');
  NomeCampo.Lines.Add(UpperCase('Exercicio'));
  DscCampo.Lines.Add('Exercício dos Parâmetros do Relatório');
  NomeCampo.Lines.Add(UpperCase('FlagTipoNegativo'));
  DscCampo.Lines.Add('Flag de Cálculo Interna (não usar)');
  NomeCampo.Lines.Add(UpperCase('NomeContaInd'));
  DscCampo.Lines.Add('Nome da Conta Orçamentária Indentada');
  NomeCampo.Lines.Add(UpperCase('NomeConta'));
  DscCampo.Lines.Add('Nome da Conta Orçamentária');
  NomeCampo.Lines.Add(UpperCase('NumLinha'));
  DscCampo.Lines.Add('Nº da Linha do Relatório');
  NomeCampo.Lines.Add(UpperCase('CodigoConta'));
  DscCampo.Lines.Add('Cód da Conta Orçamentária');
  NomeCampo.Lines.Add(UpperCase('CodigoConta100'));
  DscCampo.Lines.Add('Cód da Conta Orçamentária para 100%');
  NomeCampo.Lines.Add(UpperCase('Indentacao'));
  DscCampo.Lines.Add('Indentação da Conta (não usar)');
  NomeCampo.Lines.Add(UpperCase('NumDecimais'));
  DscCampo.Lines.Add('Nº casas decimais exibição (não usar)');
  NomeCampo.Lines.Add(UpperCase('FlagMonetaria'));
  DscCampo.Lines.Add('Flag indic a Conta é Monetária ou não');
  NomeCampo.Lines.Add(UpperCase('FlagInterna1'));
  DscCampo.Lines.Add('Flag de Cálculo Interna (não usar)');
  NomeCampo.Lines.Add(UpperCase('Linha1'));
  DscCampo.Lines.Add('Flag indic Espaço entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Linha2'));
  DscCampo.Lines.Add('Flag indic Linha Fina entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Linha3'));
  DscCampo.Lines.Add('Flag indic Linha Grossa entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Linha4'));
  DscCampo.Lines.Add('Flag indic Linha Dupla entre os elementos');
  NomeCampo.Lines.Add(UpperCase('Periodo'));
  DscCampo.Lines.Add('Per inicial dos Parâmetros do Relatório');
  NomeCampo.Lines.Add(UpperCase('Exercicio'));
  DscCampo.Lines.Add('Exerc dos Parâmetros do Relatório');
  NomeCampo.Lines.Add('R01_JANEIRO');
  DscCampo.Lines.Add('Vlrs Reals meses Janeiro');
  NomeCampo.Lines.Add('R02_FEVEREIRO');
  DscCampo.Lines.Add('Vlrs Reals meses Fevereiro');
  NomeCampo.Lines.Add('R03_MARCO');
  DscCampo.Lines.Add('Vlrs Reals meses Março');
  NomeCampo.Lines.Add('R04_ABRIL');
  DscCampo.Lines.Add('Vlrs Reals meses Abril');
  NomeCampo.Lines.Add('R05_MAIO');
  DscCampo.Lines.Add('Vlrs Reals meses Maio');
  NomeCampo.Lines.Add('R06_JUNHO');
  DscCampo.Lines.Add('Vlrs Reals meses Junho');
  NomeCampo.Lines.Add('R07_JULHO');
  DscCampo.Lines.Add('Vlrs Reals meses Julho');
  NomeCampo.Lines.Add('R08_AGOSTO');
  DscCampo.Lines.Add('Vlrs Reals meses Agosto');
  NomeCampo.Lines.Add('R09_SETEMBRO');
  DscCampo.Lines.Add('Vlrs Reals meses Setembro');
  NomeCampo.Lines.Add('R10_OUTUBRO');
  DscCampo.Lines.Add('Vlrs Reals meses Outubro');
  NomeCampo.Lines.Add('R11_NOVEMBRO');
  DscCampo.Lines.Add('Vlrs Reals meses Novembro');
  NomeCampo.Lines.Add('R12_DEZEMBRO');
  DscCampo.Lines.Add('Vlrs Reals meses Dezembro');
  NomeCampo.Lines.Add('O01_JANEIRO');
  DscCampo.Lines.Add('Vlrs Orç meses Janeiro');
  NomeCampo.Lines.Add('O02_FEVEREIRO');
  DscCampo.Lines.Add('Vlrs Orç meses Fevereiro');
  NomeCampo.Lines.Add('O03_MARCO');
  DscCampo.Lines.Add('Vlrs Orç meses Março');
  NomeCampo.Lines.Add('O04_ABRIL');
  DscCampo.Lines.Add('Vlrs Orç meses Abril');
  NomeCampo.Lines.Add('O05_MAIO');
  DscCampo.Lines.Add('Vlrs Orç meses Maio');
  NomeCampo.Lines.Add('O06_JUNHO');
  DscCampo.Lines.Add('Vlrs Orç meses Junho');
  NomeCampo.Lines.Add('O07_JULHO');
  DscCampo.Lines.Add('Vlrs Orç meses Julho');
  NomeCampo.Lines.Add('O08_AGOSTO');
  DscCampo.Lines.Add('Vlrs Orç meses Agosto');
  NomeCampo.Lines.Add('O09_SETEMBRO');
  DscCampo.Lines.Add('Vlrs Orç meses Setembro');
  NomeCampo.Lines.Add('O10_OUTUBRO');
  DscCampo.Lines.Add('Vlrs Orç meses Outubro');
  NomeCampo.Lines.Add('O11_NOVEMBRO');
  DscCampo.Lines.Add('Vlrs Orç meses Novembro');
  NomeCampo.Lines.Add('O12_DEZEMBRO');
  DscCampo.Lines.Add('Vlrs Orç meses Dezembro');
  NomeCampo.Lines.Add('AR01_JANEIRO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Janeiro');
  NomeCampo.Lines.Add('AR02_FEVEREIRO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Fevereiro');
  NomeCampo.Lines.Add('AR03_MARCO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Março');
  NomeCampo.Lines.Add('AR04_ABRIL');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Abril');
  NomeCampo.Lines.Add('AR05_MAIO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Maio');
  NomeCampo.Lines.Add('AR06_JUNHO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Junho');
  NomeCampo.Lines.Add('AR07_JULHO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Julho');
  NomeCampo.Lines.Add('AR08_AGOSTO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Agosto');
  NomeCampo.Lines.Add('AR09_SETEMBRO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Setembro');
  NomeCampo.Lines.Add('AR10_OUTUBRO');
  DscCampo.Lines.Add('Vlrs Acums Reals meses Outubro');
  NomeCampo.Lines.Add('AR11_NOVEMBRO');
  DscCampo.Lines.Add(' Vlrs Acums Reals meses Novembro');
  NomeCampo.Lines.Add('AR12_DEZEMBRO');
  DscCampo.Lines.Add(' Vlrs Acums Reals meses Dezembro');
  NomeCampo.Lines.Add('AO01_JANEIRO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Janeiro');
  NomeCampo.Lines.Add('AO02_FEVEREIRO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Fevereiro');
  NomeCampo.Lines.Add('AO03_MARCO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Março');
  NomeCampo.Lines.Add('AO04_ABRIL');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Abril');
  NomeCampo.Lines.Add('AO05_MAIO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Maio');
  NomeCampo.Lines.Add('AO06_JUNHO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Junho');
  NomeCampo.Lines.Add('AO07_JULHO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Julho');
  NomeCampo.Lines.Add('AO08_AGOSTO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Agosto');
  NomeCampo.Lines.Add('AO09_SETEMBRO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Setembro');
  NomeCampo.Lines.Add('AO10_OUTUBRO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Outubro');
  NomeCampo.Lines.Add('AO11_NOVEMBRO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Novembro');
  NomeCampo.Lines.Add('AO12_DEZEMBRO');
  DscCampo.Lines.Add('Vlrs Acums Orç meses Dezembro');

  NomeCampo.Lines.Add('AV_ORCACUMAEAT');
  DscCampo.Lines.Add('Ana Ve Orç Acum - Exerc Atu');
  NomeCampo.Lines.Add('AV_ORCAEAT');
  DscCampo.Lines.Add('Ana Ve Orç - Exerc Atu');
  NomeCampo.Lines.Add('AV_REALACUMAEAT');
  DscCampo.Lines.Add('Ana Ve Orç Acum - Exerc Atu');
  NomeCampo.Lines.Add('AV_REALAEAT');
  DscCampo.Lines.Add('Ana Ve Orç Real - Exerc Atu');

  NomeCampo.Lines.Add('DIFORCREAACUMAEAT');
  DscCampo.Lines.Add('Dif Orc Real Acum - Exerc Atu');

  NomeCampo.Lines.Add('DIFORCREALACUMEAN');
  DscCampo.Lines.Add('Dif Orc Real Acum - Exerc Ant');

  NomeCampo.Lines.Add('DIFORCREALAEAT');
  DscCampo.Lines.Add('Dif Orc Real - Exerc Atu');

  NomeCampo.Lines.Add('DIFORCREALPEREAN');
  DscCampo.Lines.Add('Dif Orc Real Per - Exerc Ant');

  NomeCampo.Lines.Add('SALDOORCAEAT');
  DscCampo.Lines.Add('Saldo Orç - Exec Atu');
  NomeCampo.Lines.Add('SALDOORCACUMAEAT');
  DscCampo.Lines.Add('Saldo Orç Acum - Exec Atu');
  NomeCampo.Lines.Add('SALDOREALACUMAEAT');
  DscCampo.Lines.Add('Saldo Real Acum - Exec Atu');
  NomeCampo.Lines.Add('SALDOREALAEAT');
  DscCampo.Lines.Add('Saldo Real - Exec Atu');

  for x := 0 to ppDemoColMes.FieldCount-1 do
    ppDemoColMes.Fields[x].FieldAlias := procuramemo(ppDemoColMes.Fields[x].FieldName);
  for x := 0 to ppConsulta.FieldCount-1 do
    ppConsulta.Fields[x].FieldAlias := procuramemo(ppConsulta.Fields[x].FieldName);
  for x := 0 to ppRelatorio.FieldCount-1 do
    ppRelatorio.Fields[x].FieldAlias := procuramemo(ppRelatorio.Fields[x].FieldName);

  frmAguarde.Apaga;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.FormShow(Sender: TObject);
Begin
  frmAguarde.Mostra( 'Buscando dados' );

  Inherited;

  CtrlCadLayOutOrc.AbreqryRelatorio;
  frmAguarde.Apaga;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;

  bCriaTemplate := True;

  CtrlCadLayoutOrc.AbreqryReports( Cds.FieldByName('IDREPORTS').AsInteger,
                                   Cds.FieldByName('ORIGEMCM').AsInteger );
  MemReports.Lines.Clear;
  MemReports.Lines.Text := CdsReports.FieldByName('TEMPLATE').AsString;

  If dblkRelatorio.canfocus Then dblkRelatorio.SetFocus;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.CmeCadastroConfirma(Sender: TObject);
Begin

  If CmeCadastro.Operacao In [OpInserir,OpAlterar] then Begin

    If ( CtrlCadLayOutOrc.CadastroConfirma( MemReports.Lines.Text ) ) Then Begin

      If FileExists(Sistema.TempDir + ArqCmDefault) then Begin

        DeleteFile(Sistema.TempDir + ArqCmDefault);
      End;
    End Else Begin

      MsgDlg( CtrlCadLayOutOrc.MessageInfo, 'Erro', mtError, [ mbOk ], 0 );
    End;
  End;

  Inherited;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;

  If MontaSelect.RetornouValor Then Begin

    //Se houve busca, abre a query principal apenas com o registro buscado
    iIndice := StrToInt(MontaSelect.ValoresChave[0]);

    CtrlCadLayOutOrc.Procurar( iIndice );
  End;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.CmeCadastroInsert(Sender: TObject);
Begin

  //Abre a query principal contendo zero registros
  CtrlCadLayOutOrc.Procurar( 0 );

  Inherited;

  CtrlCadLayOutOrc.CadastroInsert;

  MemReports.Lines.Clear;
  bCriaTemplate := True;
End;
//************************************************
Function TfrmCadLayoutOrcMT.ProcuraMemo(ch : String) : String;
Var
  x : integer;
Begin

  Result := ch;
  For x := 0 To NomeCampo.lines.Count Do Begin

    If ( uppercase(NomeCampo.lines[x]) = uppercase(ch) ) Then Begin

      result := DscCampo.lines[x];
    End;
  End;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.btnDesenhoClick(Sender: TObject);
var sTipo : String;
Begin
  Inherited;
  frmAguarde.Mostra( 'Carregando' );
  DsgnCM.Report := nil;

  sTipo := Cds.FieldByName('FLGTIPOLAYOUT').asString;

  Case sTipo[1] Of

     '1': CtrlCadLayOutOrc.FazQueryDemoNormal;
     '2': CtrlCadLayOutOrc.FazQueryDemoColMes;

  Else
     If (dbcboTipo.Text = '') Then Begin

       MsgDlg('Tipo do Layout não informado.','Aviso',mtWarning,[mbOk],0);
       dbcboTipo.SetFocus;
       Exit;
    End;
  End;

  If Cds.FieldByName('FLGTIPOLAYOUT').asString = '1' Then Begin

    ModeloRelatCM.SetaDadosRpt(RptCm,ppConsulta,ArqCmDefault);
    RptCM.DataPipeline := ppConsulta;

  End Else Begin

    ModeloRelatCM.SetaDadosRpt(RptCm,ppDemoColMes,ArqCmDefault);
    RptCM.DataPipeline := ppDemoColMes;
  End;

  DsgnCM.Report := RptCM;

  case CmeCadastro.Operacao of
     OpInserir:
        Begin
           if bCriaTemplate then Begin
              try
                 ModeloRelatCM.CmDefault.SaveToFile(Sistema.TempDir + ArqCmDefault);
              finally
                 bCriaTemplate := False;
              End;
           End;
        End;
     OpAlterar:
        Begin
           if bCriaTemplate then Begin
              MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmDefault);
              bCriaTemplate := False;
           End;
        End;
  End;

  RptCM.Template.LoadFromFile;

  If Cds.FieldByName('FLGTIPOLAYOUT').asString = '1' Then Begin
    ModeloRelatCM.SetaDadosRpt(RptCm,ppConsulta,ArqCmDefault);
    RptCM.DataPipeline := ppConsulta;

  End Else Begin
    ModeloRelatCM.SetaDadosRpt(RptCm,ppDemoColMes,ArqCmDefault);
    RptCM.DataPipeline := ppDemoColMes;
  End;

  CtrlCadLayOutOrc.FazQueryDemoNormal;
  frmAguarde.Apaga;

  DsgnCM.ShowModal;

  MemReports.Lines.LoadFromFile(Sistema.TempDir + ArqCmDefault);

  RptCM.Reset;
  RptCM.ResetDevices;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.FormClose(Sender: TObject; var Action: TCloseAction);
Begin

  Inherited;
  ModeloRelatCM.Free;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.mniFileSaveClick(Sender: TObject);
Begin
  Inherited;
  If ( Cds.FieldByName('FLGTIPOLAYOUT').asString = '1' ) Then Begin

    ModeloRelatCM.SetaDadosRpt(RptCm,ppConsulta,ArqCmDefault);
    RptCM.DataPipeline := ppConsulta;

  End Else Begin

    ModeloRelatCM.SetaDadosRpt(RptCm,ppDemoColMes,ArqCmDefault);
    RptCM.DataPipeline := ppDemoColMes;
  End;

  RptCM.Template.SaveToFile;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.Sair1Click(Sender: TObject);
Begin
  Inherited;

  If Cds.FieldByName('FLGTIPOLAYOUT').asString = '1' Then Begin

    ModeloRelatCM.SetaDadosRpt(RptCm,ppConsulta,ArqCmDefault);
    RptCM.DataPipeline := ppConsulta;

  End Else Begin

    ModeloRelatCM.SetaDadosRpt(RptCm,ppDemoColMes,ArqCmDefault);
    RptCM.DataPipeline := ppDemoColMes;
  End;

  RptCM.Template.SaveToFile;
  DsgnCM.Close;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.mniFilePageSetupClick(Sender: TObject);
var
   lPageSetupDlg: TppCustomPageSetupDialog;
   lFormClass: TFormClass;
Begin
   Inherited;

   if (DsgnCM.CurrentReport = nil) then Exit;

   lFormClass := ppGetFormClass(TppCustomPageSetupDialog);
   lPageSetupDlg := TppCustomPageSetupDialog(lFormClass.Create(Self));

   lPageSetupDlg.Report := DsgnCM.CurrentReport;
   lPageSetupDlg.ShowModal;

   lPageSetupDlg.Free;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.mniFilePrintClick(Sender: TObject);
Begin
  Inherited;

  If (DsgnCM.Report = nil) then Exit;
      DsgnCM.PrintReport;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.mniFilePrintToFileSetupClick(Sender: TObject);
var
  lTextFileDialog: TppCustomPrintToFileSetupDialog;
  lFormClass: TFormClass;
Begin
  Inherited;
  if (DsgnCM.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPrintToFileSetupDialog);

  lTextFileDialog := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

  lTextFileDialog.Report := DsgnCM.Report;
  lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;
  lTextFileDialog.ShowModal;

  lTextFileDialog.Free;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.DsgnCMCreate(Sender: TObject);
var
   X,Y: Integer;
Begin
   Inherited;
   //** Lista para um memo todos os Menus e Submenus do Design de relatórios

   for X:=0 To DsgnCM.Menu.items.count - 1 do Begin
      for y:=0 to DsgnCM.Menu.items[x].Count - 1 do Begin
          if DsgnCM.Menu.items[x].items[y].name = 'mniReportData' then
             DsgnCM.Menu.items[x].items[y].Visible := False
          else
             if DsgnCM.Menu.items[x].items[y].name = 'N1' then
                DsgnCM.Menu.items[x].items[y].Visible := False
             else
                if DsgnCM.Menu.items[x].items[y].name = 'mniViewLine3' then
                   DsgnCM.Menu.items[x].items[y].Visible := False
                else
                   if DsgnCM.Menu.items[x].items[y].name = 'mniViewOutline' then
                      DsgnCM.Menu.items[x].items[y].Visible := False;
      End;
   End;
End;
//************************************************
Procedure TfrmCadLayoutOrcMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Begin
  Accept := False;
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then Begin
    //Faz a verificação do preenchimento dos campos
    if (dblkRelatorio.Text = '') then Begin
      MsgDlg('Relatório não selecionado.','Aviso',mtWarning,[mbOk],0);
      dblkRelatorio.SetFocus;
      exit;
    End;

    if (dbcboTipo.Text = '') then Begin
      MsgDlg('Tipo do Layout não informado.','Aviso',mtWarning,[mbOk],0);
      dbcboTipo.SetFocus;
      exit;
    End;

    if (dbeNome.Text = '') then Begin
      MsgDlg('Nome do Layout não informado.','Aviso',mtWarning,[mbOk],0);
      dbeNome.SetFocus;
      exit;
    End;

    if MemReports.Lines.Count = 0 then Begin
      MsgDlg('Não foi definido o Desenho do Relatório.','Aviso',MtWarning,[MbOk],0);
      btnDesenho.SetFocus;
      Exit;
    End;
  End;

  Accept := True;

  inherited;
end;
//************************************************
Procedure TfrmCadLayoutOrcMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlCadLayOutOrc.AplicaOperacaoCadLayOutOrcDelete;
End;
//************************************************
End.
