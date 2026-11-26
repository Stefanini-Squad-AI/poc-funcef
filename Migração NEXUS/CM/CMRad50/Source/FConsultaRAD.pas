unit FConsultaRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlRADPlus, uSistema,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlPadroes, DbClient, TREdit, uMensErro,
  JCLSysUtils, fParamReports_Padrao, CmParamReport;

type

  TfrmConsultaRAD = class(TfrmParamReports_Padrao)
    bbtnParticipante: TBitBtn;
    pgctrlBusca: TPageControl;
    tbsBusca: TTabSheet;
    pnlInscricao: TPanel;
    Label5: TLabel;
    cmbInscricao: TComboBox;
    edInscricao: TEdit;
    pnlNome: TPanel;
    Label2: TLabel;
    cmbNome: TComboBox;
    edNome: TEdit;
    pnlCPF: TPanel;
    Label3: TLabel;
    cmbCPF: TComboBox;
    edCPF: TEdit;
    PnlSitFund: TPanel;
    Label4: TLabel;
    CmbSitPlano: TComboBox;
    EdSitPlano: TEdit;
    PnlPlano: TPanel;
    Label6: TLabel;
    CmbPlano: TComboBox;
    edPlano: TEdit;
    PnlPatro: TPanel;
    Label7: TLabel;
    CmbPatro: TComboBox;
    EdPatro: TEdit;
    pnlMatricula: TPanel;
    Label9: TLabel;
    cmbMatricula: TComboBox;
    edMatricula: TEdit;
    pnlSitPatro: TPanel;
    Label1: TLabel;
    cmbSitPatro: TComboBox;
    edSitPatro: TEdit;
    Panel1: TPanel;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Panel2: TPanel;
    Label11: TLabel;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    Panel3: TPanel;
    Label8: TLabel;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    Panel4: TPanel;
    Label12: TLabel;
    ComboBox4: TComboBox;
    Edit4: TEdit;
    Panel5: TPanel;
    Label13: TLabel;
    ComboBox5: TComboBox;
    Edit5: TEdit;
    Panel6: TPanel;
    Label14: TLabel;
    ComboBox6: TComboBox;
    Edit6: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox: TScrollBox;
    pnlProcesso: TPanel;
    Label21: TLabel;
    cbProcesso: TComboBox;
    Panel12: TPanel;
    Label20: TLabel;
    cbUsuAprovador: TComboBox;
    edUsuAprov: TEdit;
    Panel10: TPanel;
    Label18: TLabel;
    cbSituProc: TComboBox;
    Panel9: TPanel;
    Label17: TLabel;
    cbIniProcesso: TComboBox;
    Panel17: TPanel;
    Label25: TLabel;
    cbCCusto: TComboBox;
    edCCusto: TEdit;
    Panel18: TPanel;
    Label26: TLabel;
    cbCRespon: TComboBox;
    edCRespon: TEdit;
    Panel19: TPanel;
    Label27: TLabel;
    cbGrupoProd: TComboBox;
    edGrupoProd: TEdit;
    Panel20: TPanel;
    Label28: TLabel;
    cbTipoProcesso: TComboBox;
    edTipoProcesso: TEdit;
    Panel7: TPanel;
    Label15: TLabel;
    cbUsuSolic: TComboBox;
    edUsuSolic: TEdit;
    Panel11: TPanel;
    Label19: TLabel;
    cbAtivProjeto: TComboBox;
    edAtivProjeto: TEdit;
    Panel15: TPanel;
    Label23: TLabel;
    cbTerminoProcesso: TComboBox;
    Panel21: TPanel;
    Label29: TLabel;
    cbValor: TComboBox;
    edValor: TEdit;
    dtIniProc: TCMDateTimePicker;
    dtFimProc: TCMDateTimePicker;
    edProcesso: TEdit;
    Panel8: TPanel;
    Label16: TLabel;
    cbTipoDoc: TComboBox;
    edTipoDoc: TEdit;
    Panel14: TPanel;
    chkRessalva: TCheckBox;
    Panel16: TPanel;
    Label22: TLabel;
    cbGrupoAprov: TComboBox;
    edGrupoAprov: TEdit;
    cbUsuarioEtapa: TComboBox;
    cbGrupoEtapa: TComboBox;
    cbRessalvaEtapa: TComboBox;
    pnlOrdenacao: TPanel;
    Label24: TLabel;
    cbOrdenacao: TComboBox;
    Panel13: TPanel;
    Label30: TLabel;
    cbClassificacao: TComboBox;
    cbExpande: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnParticipanteClick(Sender: TObject);
    procedure edProcessoKeyPress(Sender: TObject; var Key: Char);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    RadPlus: TCtrlRADPlus;
    FcdsConsulta: TClientDataSet;
    function TrataFiltro(ItemIndex: integer; TipoFiltro: TTipoFiltro): TFiltroProcesso; overload;
    function TrataFiltro(ItemIndex: integer): TFiltroEtapa; overload;
    function PreparaCondicao(ConteudoTexto: string; TipoFiltro: TTipoFiltro): string;
    function TemFiltrosDeConsulta: boolean;

    procedure SetcdsConsulta(const Value: TClientDataSet);
  public
    { Public declarations }
    property cdsConsulta: TClientDataSet read FcdsConsulta write SetcdsConsulta;
  end;

var
  frmConsultaRAD   : TfrmConsultaRAD;
  oUltimoResultado : OLEvariant;
  iOrdem           : integer;
  bExpande         : boolean;

implementation
uses
    FProcessosRAD;

{$R *.DFM}

procedure TfrmConsultaRAD.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;

  oUltimoResultado := null;
  iOrdem           := 0;
  bExpande         := False;

  RADPlus := TCtrlRADPlus.Create;
  RadPlus.InitializeAs(Padroes);
  FcdsConsulta := TClientDataSet.Create(Self);

  for i := 0 to ( Self.ComponentCount ) - 1 do
  begin
    if ( Self.Components[i] is TComboBox ) then
      ( Self.Components[i] as TComboBox ).ItemIndex := 0;
  end;

  cbIniProcesso.ItemIndex     := 1;
  cbTerminoProcesso.ItemIndex := 3;

  cbSituProc.ItemIndex      := -1;
  cbUsuarioEtapa.ItemIndex  := 0;
  cbGrupoetapa.ItemIndex    := 0;
  cbRessalvaEtapa.ItemIndex := 0;

  cbOrdenacao.ItemIndex := 0;
  pnlOrdenacao.Visible  := False;

  cbClassificacao.ItemIndex := 0;
end;

procedure TfrmConsultaRAD.bbtnParticipanteClick(Sender: TObject);
var
  iQtde, iQtdeTerceiros: integer;
begin
  inherited;

  if ( not TemFiltrosDeConsulta ) then
  begin
    if MsgDlg( 'Não foram selecionados filtros para a busca, e por isso sua ' + #13#10 +
                'pesquisa pode demorar a ser exibida. Deseja continuar ?', 'Aviso', mtWarning, [mbYes,mbNo],0) = mrNo then
      exit;
  end;

  FcdsConsulta.Data := RadPlus.ConsultaProcessos( 0,
                                                  iQtde,
                                                  iQtdeTerceiros,
                                                  ( cbClassificacao.ItemIndex = 0 ) or ( cbClassificacao.ItemIndex = 2 ),
                                                  ( cbClassificacao.ItemIndex = 0 ) or ( cbClassificacao.ItemIndex = 1 ),
                                                  False,
                                                  False,
                                                  TrataFiltro(cbProcesso.ItemIndex, tfNumero),
                                                  PreparaCondicao(edProcesso.Text, tfNumero),
                                                  TrataFiltro(cbTipoProcesso.ItemIndex, tfTexto),
                                                  PreparaCondicao(edTipoProcesso.Text, tfTexto),
                                                  TrataFiltro(cbUsuSolic.ItemIndex, tfTexto),
                                                  PreparaCondicao(edUsuSolic.Text, tfTexto),
                                                  TrataFiltro(cbUsuAprovador.ItemIndex, tfTexto),
                                                  PreparaCondicao(edUsuAprov.Text, tfTexto),
                                                  TrataFiltro(cbUsuarioEtapa.ItemIndex),
                                                  TrataFiltro(cbIniProcesso.ItemIndex, tfData),
                                                  PreparaCondicao(dtIniProc.Text, tfData),
                                                  TrataFiltro(cbTerminoProcesso.ItemIndex, tfData),
                                                  PreparaCondicao(dtFimProc.Text, tfData),
                                                  TrataFiltro(1, tfTexto), //amf 01.11.2006 igual a - sempre fixo, devido a substituição pelo combobox cbSituProc
                                                  PreparaCondicao(cbSituProc.Text, tfTexto),
                                                  TrataFiltro(cbValor.ItemIndex, tfNumero),
                                                  PreparaCondicao(edValor.Text, tfNumero),
                                                  TrataFiltro(cbCCusto.ItemIndex, tfTexto),
                                                  PreparaCondicao(edCCusto.Text, tfTexto),
                                                  TrataFiltro(cbCRespon.ItemIndex, tfTexto),
                                                  PreparaCondicao(edCRespon.Text, tfTexto),
                                                  TrataFiltro(cbGrupoProd.ItemIndex, tfTexto),
                                                  PreparaCondicao(edGrupoProd.Text, tfTexto),
                                                  TrataFiltro(cbAtivProjeto.ItemIndex, tfTexto),
                                                  PreparaCondicao(edAtivProjeto.Text, tfTexto),
                                                  TrataFiltro(cbTipoDoc.ItemIndex, tfTexto),
                                                  PreparaCondicao(edTipoDoc.Text, tfTexto),
                                                  TrataFiltro(cbGrupoAprov.ItemIndex, tfTexto),
                                                  PreparaCondicao(edGrupoAprov.Text, tfTexto),
                                                  TrataFiltro(cbGrupoEtapa.ItemIndex),
                                                  PreparaCondicao(iff(chkRessalva.Checked, '1', '0'), tfTexto),
                                                  TrataFiltro(cbRessalvaEtapa.ItemIndex),
                                                  True );

  cmp_padrao.ParamValues[0].AsInteger := 1;

  oUltimoResultado := FcdsConsulta.Data;
  iOrdem           := cbOrdenacao.ItemIndex + 1;
  bExpande         := cbExpande.Checked;

  ModalResult := mrOk;
end;

function TfrmConsultaRAD.TrataFiltro(ItemIndex: integer; TipoFiltro: TTipoFiltro): TFiltroProcesso;
begin
   Result := fpComecaCom;

   case TipoFiltro of
      tfNumero: begin
                   case ItemIndex of
                      0: Result := fpIgual;
                      1: Result := fpMaiorQue;
                      2: Result := fpMaiorIgualQue;
                      3: Result := fpMenorQue;
                      4: Result := fpMenorIgualQue;
                      5: Result := fpDiferente;
                   end;
                end;

      tfData:   begin
                   case ItemIndex of
                      0: Result := fpMaiorQue;
                      1: Result := fpMaiorIgualQue;
                      2: Result := fpMenorQue;
                      3: Result := fpMenorIgualQue;
                      4: Result := fpDiferente;
                   end;
                end;

      tfTexto: begin
                 case ItemIndex of
                    0: Result := fpComecaCom;
                    1: Result := fpIgual;
                    2: Result := fpPossuiTexto;
                 end;
               end;
   end;
end;

function TfrmConsultaRAD.PreparaCondicao(ConteudoTexto: string; TipoFiltro: TTipoFiltro): string;
begin
   Result := ConteudoTexto;

   case TipoFiltro of
     tfNumero: begin
                 if (Trim(ConteudoTexto) = '') then
                    Result := '-1'
                 else
                    Result := StringReplace(ConteudoTexto, ',', '.', [rfReplaceAll]);
               end;

      tfData: begin
                if (Trim(ConteudoTexto) = '') then
                   Result := ''
              end;

     tfTexto: begin
                if (Trim(ConteudoTexto) = '') then
                    Result := '';
              end;
   end;

end;

procedure TfrmConsultaRAD.SetcdsConsulta(const Value: TClientDataSet);
begin
  FcdsConsulta := Value;
end;

procedure TfrmConsultaRAD.edProcessoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( ( Ord( Key ) < 48 ) or ( Ord( Key ) > 57 ) ) and ( Ord( Key ) <> 8 ) then
    Key := #0;
end;

procedure TfrmConsultaRAD.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( ( Ord( Key ) < 48 ) or ( Ord( Key ) > 57 ) ) and ( Ord( Key ) <> 8 ) then
  begin
    if ( Ord( Key ) = 44 ) then
      if Pos( ',', edValor.Text ) = 0 then
        exit;
    Key := #0
  end;
end;

function TfrmConsultaRAD.TemFiltrosDeConsulta: boolean;
var
  i: integer;
begin

  Result := False;

  for i := 0 to Self.ComponentCount - 1 do
  begin
     if Self.Components[i] is TEdit then
        if (TEdit(Self.Components[i]).Text <> '') then //encontrou o filtro
        begin
           Result := True;
           break;
        end;

     if Self.Components[i] is TCMDateTimePicker then
        if (TCmDateTimePicker(Self.Components[i]).Text <> '') then
        begin
           Result := True;
           break;
        end;

     if Self.Components[i] is TComboBox then
        if ( TComboBox(Self.Components[i]).Text <> '' ) and
         ( Self.Components[i] = cbSituProc ) then
        begin
           Result := True;
           break;
        end;
  end;

  if chkRessalva.Checked then Result := True;
end;

procedure TfrmConsultaRAD.FormShow(Sender: TObject);
begin
  inherited;
  ScrollBox.ScrollInView( pnlProcesso );  
  edProcesso.SetFocus;
end;

procedure TfrmConsultaRAD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;


function TfrmConsultaRAD.TrataFiltro(ItemIndex: integer): TFiltroEtapa;
begin

  Result := tfeSemFiltro;

  case ItemIndex of
    0: Result := tfeUltima;
    1: Result := tfeQualquer
  end;
  
end;


end.
