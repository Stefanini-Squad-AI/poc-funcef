{ Alterações                                                                   }
{*******************************************************************************
Analista.: Claudio Faria
Pendencia: 25977
Rotina...: uCtrlGeraDprev
Descrição: Novos Ajustes na geração do Arquivo DPrev
*******************************************************************************}
{*******************************************************************************
Analista.: Claudio Faria
Pendencia: 23297 - 10/10/2006
Rotina...: FGeraDPrevMT
Descrição: Criação da tela de exportação do arquivo DPrev
*******************************************************************************}

unit FGeraDPrevMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CMProcuraSubTipo, ComCtrls, uCtrlGeraDPrev,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, Mask, Db, DBClient,
  uCMClientDataSet, wwdblook;

type
  TfrmGeraDprevMT = class(TfrmSairAjuda)
    grpBoxImport: TGroupBox;
    edtImport: TEdit;
    btbtnSeleciona: TBitBtn;
    PSubTipoRepresentante: TCMProcuraSubTipo;
    bbtnGera: TBitBtn;
    gbAnoCalendario: TGroupBox;
    edtAno: TEdit;
    UpDown1: TUpDown;
    rdgrpTipoDeclaracao: TRadioGroup;
    svDPrev: TSaveDialog;
    grpbxUltRecibo: TGroupBox;
    reUltRecibo: TRealEdit;
    PSubTipoResponsavel: TCMProcuraSubTipo;
    plEmpresa: TPanel;
    mkNatureza: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    mkCNAE: TMaskEdit;
    Panel1: TPanel;
    cmcdsSitPlanoPrev: TCMClientDataSet;
    cmcdsSitPart: TCMClientDataSet;
    Label3: TLabel;
    dblkPortabilidade: TwwDBLookupCombo;
    procedure btbtnSelecionaClick(Sender: TObject);
    procedure rdgrpTipoDeclaracaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnGeraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraDPrevMT : TfrmGeraDPrevMT;
  CtrlGeraDPrev  : TCtrlGeraDPrev;

implementation

uses uMensErro, uDataBase, DBaseDados, uSistema, uString;

{$R *.DFM}

procedure TfrmGeraDprevMT.btbtnSelecionaClick(Sender: TObject);
Var sTemp  : String;
    I      : integer;
    bbarra : Boolean;
begin
   edtImport.Text:= '';

   If svDPrev.Execute then
      edtImport.Text := svDPrev.FileName;
end;

procedure TfrmGeraDprevMT.rdgrpTipoDeclaracaoClick(Sender: TObject);
begin
   inherited;
   grpbxUltRecibo.Enabled := False;
   reUltRecibo.Enabled    := False;
   reUltRecibo.Value := 0;

   If rdgrpTipoDeclaracao.ItemIndex = 1 Then
   Begin
      grpbxUltRecibo.Enabled := True;
      reUltRecibo.Enabled    := True;
   End;
end;

procedure TfrmGeraDprevMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlGeraDPrev := TCtrlGeraDPrev.Create;
  ctrlGeraDPrev.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                           Sistema.AppRemoteServer,False);
end;

procedure TfrmGeraDprevMT.bbtnGeraClick(Sender: TObject);
Var DtInicio, DtFinal, sIDSitPlanoPrev:String;
begin
  inherited;

  {--------------------------------------------}
  { Críticas para a geração do DPrev  - Ínicio }

  If PSubTipoRepresentante.SubTipoReg.RazaoSocial = '' Then
  Begin
    MsgDlg('É obrigatório o nome do representante da fundação', 'Informação', mtInformation, [mbOk], 0);
    PSubTipoRepresentante.SetFocus;
    Exit;
  End;

  If PSubTipoResponsavel.SubTipoReg.RazaoSocial = ''   Then
  Begin
    MsgDlg('É obrigatório o nome do responsável pelo preenchimento', 'Informação', mtInformation, [mbOk], 0);
    PSubTipoResponsavel.SetFocus;
    Exit;
  End;

  If ( rdgrpTipoDeclaracao.ItemIndex = 1 ) and ( reUltRecibo.Value <= 0 ) Then
  Begin
    MsgDlg('É Obrigatório preencher o nº do último registro, quando a declaração for do tipo Retificadora', 'Informação', mtInformation, [mbOk], 0);
    reUltRecibo.SetFocus;
    Exit;
  End;

  If ( edtImport.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher o local de gravação do arquuivo de exportação', 'Informação', mtInformation, [mbOk], 0);
    btbtnSelecionaClick(Sender);
    Exit;
  End;

  If ( mkNatureza.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher a Natureza Jurídica', 'Informação', mtInformation, [mbOk], 0);
    mkNatureza.SetFocus;
    Exit;
  End;

  If ( mkCNAE.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher o CNAE-Fiscal', 'Informação', mtInformation, [mbOk], 0);
    mkCNAE.SetFocus;
    Exit;
  End;

  DtInicio := '01/01/' + edtAno.Text;
  DtFinal  := '31/12/' + edtAno.Text;

  sIDSitPlanoPrev := '';
  If dblkPortabilidade.Text <> '' Then
     sIDSitPlanoPrev := dblkPortabilidade.LookupValue;

  { Críticas para a geração do DPrev - Fim    }
  {--------------------------------------------}

  Try
    CtrlGeraDPrev.Exporta( edtImport.Text,
                           IntToStr( PSubTipoResponsavel.SubTipoReg.Id ),
                           IntToStr( PSubTipoRepresentante.SubTipoReg.Id ),
                           edtAno.Text,
                           IntToStr( rdgrpTipoDeclaracao.ItemIndex ),
                           reUltRecibo.Text,
                           DtInicio, DtFinal,
                           '00', sIDSitPlanoPrev,
                           mkNatureza.Text, mkCNAE.Text, '' );

    MsgDlg('Geração realizada com sucesso.', 'Informação', mtInformation, [mbOk], 0);
  except
    MsgDlg('Não foi possível gerar o arquivo de exportação do DPrev','Erro',mtError,[mbOk],0);
  end;

end;

procedure TfrmGeraDprevMT.FormShow(Sender: TObject);
begin
  inherited;

  cmcdsSitPart.Data      := CtrlGeraDPrev.ListaSitPart;

  edtAno.Text := Copy(DateToStr(Date), 7, 4);
end;

end.
