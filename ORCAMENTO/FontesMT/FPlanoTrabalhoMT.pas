unit FPlanoTrabalhoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlPlanoTrabalho, DBTables, Wwquery, DBCtrls,
  uCtrlPeriodoOrcamen, Mask, wwdbedit, uCtrlUnidNegocio, uCtrlCentRespon, uCMTypes,
  ComCtrls, uCmSqlParams;

type
  TfrmPlanoTrabalhoMT = class(TFrmCadastroMT)
    lblUnidNegoc: TLabel;
    dblcUnidNegocio: TwwDBLookupCombo;
    cdsUnidNegocio: TCMClientDataSet;
    Label2: TLabel;
    dblcPeriodoIni: TwwDBLookupCombo;
    Label3: TLabel;
    dblcPeriodoFim: TwwDBLookupCombo;
    cdsPeriodoIni: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    dbmObjetivo: TDBMemo;
    lblObjetivo: TLabel;
    dbmNecessidade: TDBMemo;
    lblNecessidade: TLabel;
    dbrgPrioridade: TDBRadioGroup;
    Label4: TLabel;
    dbmResultEsperados: TDBMemo;
    dbmNaoAtendimento: TDBMemo;
    Label5: TLabel;
    dbedCodigo: TwwDBEdit;
    dbedDescricao: TwwDBEdit;
    lblCentRespon: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    cdsCentRespon: TCMClientDataSet;
    lblTipoAtividade: TLabel;
    CMSqlParams1: TCMSqlParams;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dblcUnidNegocioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUnidNegocioExit(Sender: TObject);

  Private
    { Private declarations }
    PlanoTrabalho : TCtrlPlanoTrabalho;
    UnidNegocio   : TCtrlUnidNegocio;
    CentRespon    : TCtrlCentRespon;
    PeriodoOrcamen: TCtrlPeriodoOrcamen;
    procedure AtualizaLlbAtividade;
    Procedure PosicionaPeriodo( pCdsPeriodo  : TCMClientDataSet;
                                pEXERCICIO,
                                pPERIODO     : Integer;
                                pDblcPeriodo : TwwDBLookupCombo );
  Public
    { Public declarations }

  End;

Var
  frmPlanoTrabalhoMT: TfrmPlanoTrabalhoMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmPlanoTrabalhoMT.FormCreate(Sender: TObject);
begin
  inherited;

  AtualizaLlbAtividade;

  MontaSelect.Filtro.Add('PLANOTRABALHOORC.IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  PlanoTrabalho := TCtrlPlanoTrabalho.Create;
  UnidNegocio   := TCtrlUnidNegocio.Create;
  CentRespon    := TCtrlCentRespon.Create;
  PeriodoOrcamen:= TCtrlPeriodoOrcamen.Create;

  PlanoTrabalho.Initialize( DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False );

  UnidNegocio.Initialize( DtmBaseDados.dbBaseDados, True,
                          Sistema.ConnectionType,   Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,  True, nil, nil, False );

  CentRespon.Initialize( DtmBaseDados.dbBaseDados, True,
                         Sistema.ConnectionType,   Sistema.ConnectionSide,
                         Sistema.AppRemoteServer,  True, nil, nil, False );

  PeriodoOrcamen.Initialize( DtmBaseDados.dbBaseDados, True,
                             Sistema.ConnectionType,   Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,  True, nil, nil, False );

  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  PlanoTrabalho.CdsPlanoTrabalho := cds;
  //
  cds.Data := PlanoTrabalho.Procurar(-1);
  cdsUnidNegocio.Data := UnidNegocio.ListaUnidNegocio(Sistema.idEmpresa,0,'',tapSoAnaliticaAP,toapNome);
  cdsCentRespon.Data  := CentRespon.ListaCentResponXUsu(Sistema.idUsuario,Sistema.idEmpresa,tcrSoAnalitica,tocrNome);


  cdsPeriodoIni.Data  := PeriodoOrcamen.ListaPeriodoOrc(Sistema.idEmpresa,0);
  cdsPeriodoFim.Data  := PeriodoOrcamen.ListaPeriodoOrc(Sistema.idEmpresa,0);
end;

procedure TfrmPlanoTrabalhoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PlanoTrabalho.Free;
  UnidNegocio.Free;
  CentRespon.Free;
  PeriodoOrcamen.Free;
end;

procedure TfrmPlanoTrabalhoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := False;
  if trim(dbedDescricao.Text)='' then begin
     MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOk],0);
     dbedDescricao.SetFocus;
     exit;
  end;
  if trim(dblcUnidNegocio.Text)='' then begin
     MsgDlg('Obrigatório preencher o Atividade/Projeto','Erro',mtError,[mbOk],0);
     dblcUnidNegocio.SetFocus;
     exit;
  end;
  if trim(dblcPeriodoIni.Text)='' then begin
     MsgDlg('Obrigatório preencher o Período Inicial','Erro',mtError,[mbOk],0);
     dblcPeriodoIni.SetFocus;
     exit;
  end;
  if trim(dblcPeriodoFim.Text)='' then begin
     MsgDlg('Obrigatório preencher o Período Final','Erro',mtError,[mbOk],0);
     dblcPeriodoFim.SetFocus;
     exit;
  end;
  if trim(dblcCentRespon.Text)='' then begin
     MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk],0);
     dblcCentRespon.SetFocus;
     exit;
  end;
  if trim(dbmObjetivo.Text)='' then begin
     MsgDlg('Obrigatório preencher o Objetivo','Erro',mtError,[mbOk],0);
     dbmObjetivo.SetFocus;
     exit;
  end;
  cds.FieldByName('EXERCICIOINI').AsInteger := cdsPeriodoIni.FieldByName('EXERCICIO').AsInteger;
  cds.FieldByName('EXERCICIOFIM').AsInteger := cdsPeriodoFim.FieldByName('EXERCICIO').AsInteger;
  cds.FieldByName('IDPESSOA').AsFloat       := Sistema.idEmpresa;
  Accept := True;
  inherited;
end;


procedure TfrmPlanoTrabalhoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('PRIORIDADE').AsString := 'B';
  dblcPeriodoIni.SetFocus;
end;

procedure TfrmPlanoTrabalhoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcPeriodoIni.SetFocus;
end;
//************************************************
Procedure TfrmPlanoTrabalhoMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then Begin

    cds.Data := PlanoTrabalho.Procurar(StrtoFloat(MontaSelect.ValoresChave[0]));

    PosicionaPeriodo( CdsPeriodoIni,
                      Cds.FieldByName( 'EXERCICIOINI' ).AsInteger,
                      Cds.FieldByName( 'PERIODOINI' ).AsInteger,
                      dblcPeriodoIni );

    PosicionaPeriodo( CdsPeriodoFim,
                      Cds.FieldByName( 'EXERCICIOFIM' ).AsInteger,
                      Cds.FieldByName( 'PERIODOFIM' ).AsInteger,
                      dblcPeriodoFim );
  End;
End;

procedure TfrmPlanoTrabalhoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PlanoTrabalho.AplicaOperacaoPlanoTrabalho;
end;

procedure TfrmPlanoTrabalhoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PlanoTrabalho.AplicaOperacaoPlanoTrabalho;
end;

procedure TfrmPlanoTrabalhoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PlanoTrabalho.AplicaOperacaoPlanoTrabalho;
end;

procedure TfrmPlanoTrabalhoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if OrigemAbortConfirma <> OaBeforeConfirma then
     MsgDlg('Ocorreu o seguinte erro : '+ PlanoTrabalho.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmPlanoTrabalhoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  cds.Data := PlanoTrabalho.Procurar(cds.FieldByName('IDPLANOTRABALHO').AsFloat);
end;
//************************************************
Procedure TfrmPlanoTrabalhoMT.dblcUnidNegocioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If ( Modified ) Then Begin

    AtualizaLlbAtividade;
  End;
End;
//************************************************
Procedure TfrmPlanoTrabalhoMT.dblcUnidNegocioExit(Sender: TObject);
Begin

  AtualizaLlbAtividade;
End;
//************************************************
procedure TfrmPlanoTrabalhoMT.AtualizaLlbAtividade;
Begin

  If ( dblcUnidNegocio.Text = '' ) Then

    lblTipoAtividade.Caption := ''

  Else If ( cdsUnidNegocio.FieldByName( 'UNETIPO' ).AsString = 'A' ) Then

    lblTipoAtividade.Caption := 'Analítico'

  Else If ( cdsUnidNegocio.FieldByName( 'UNETIPO' ).AsString = 'S' ) Then Begin

    lblTipoAtividade.Caption := 'Sintético';
    MsgDlg( 'Foi selecionado um grupo SINTÉTICO', 'Aviso', mtWarning, [ mbOk ], 0 );

  End Else Begin

    lblTipoAtividade.Caption := '';
  End;
End;
//************************************************
Procedure TfrmPlanoTrabalhoMT.PosicionaPeriodo( pCdsPeriodo  : TCMClientDataSet;
                                                pEXERCICIO,
                                                pPERIODO     : Integer;
                                                pDblcPeriodo : TwwDBLookupCombo );
Var
  Encontrou : Boolean;

Begin
  Encontrou := False;

  While ( Not pCdsPeriodo.Eof ) And
        ( Not Encontrou )       Do Begin

    Encontrou := ( ( pEXERCICIO = pCdsPeriodo.FieldByName( 'EXERCICIO' ).AsInteger ) And
                   ( pPERIODO   = pCdsPeriodo.FieldByName( 'PERIODO' ).AsInteger ) );

    If ( Not Encontrou ) Then Begin

      pCdsPeriodo.Next;
    End;
  End;

  pDblcPeriodo.RefreshDisplay;
End;
//************************************************
End.
