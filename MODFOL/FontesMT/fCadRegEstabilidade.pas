{--------------------------------------------------------------------------------------------------
Nº SOL............: 229881.16650 
Nº PPM............: 566001
Data da Alteração.: 03/03/2015
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229881 -
                    Registro de Estabilidade Funcional.
--------------------------------------------------------------------------------------------------
}

unit fCadRegEstabilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, uCtrlPessoaFuncionario, uCtrlEstabilidade;

type
  TFrmCadRegEstabilidade = class(TFrmCadastroMestreDetMT)
    lblMatricula: TLabel;
    lblNome: TLabel;
    dbmMATRICULA: TwwDBEdit;
    dbmNOME: TwwDBEdit;
    lblDtInicio: TLabel;
    lblDtFim: TLabel;
    lblMotivo: TLabel;
    lblObs: TLabel;
    dbmObs: TMemo;
    CdsDet: TCMClientDataSet;
    cboMotivo: TComboBox;
    tmpDataInicio: TCMDateTimePicker;
    tmpDataFim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure cboMotivoKeyPress(Sender: TObject; var Key: Char);
  private
    CtrlEstabilidade: TCtrlEstabilidade;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    pIsExcluir           : Boolean;
    pIsAlterar           : Boolean;

    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
    procedure LimparCampos;
    procedure CarregaCamposAlteracao;
    function ValidarCampos: boolean;
  public
    { Public declarations }
  end;

var
  FrmCadRegEstabilidade: TFrmCadRegEstabilidade;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

const iHelp = 0;

{$R *.DFM}

procedure TFrmCadRegEstabilidade.FormCreate(Sender: TObject);
begin
  inherited;


  CtrlEstabilidade := TCtrlEstabilidade.Create;
  CtrlEstabilidade.InitializeAs(Padroes);
  CtrlEstabilidade.CdsDet := CdsDet;  

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  //adiciona itens ao comboBox e valores no objeto
  cboMotivo.Items.AddObject('01 - Acidente de Trabalho', TObject(1));
  cboMotivo.Items.AddObject('02 - Mandato Sindical', TObject(2));
  cboMotivo.Items.AddObject('03 - Mandato Eleitoral', TObject(3));
  cboMotivo.Items.AddObject('04 - Gravidez', TObject(4));
  cboMotivo.Items.AddObject('05 - Prestação de Serviço Militar', TObject(5));
  cboMotivo.Items.AddObject('06 - Convenção Coletiva de Trabalho', TObject(6));
  cboMotivo.Items.AddObject('07 - Candidato da CIPA', TObject(7));
  cboMotivo.Items.AddObject('08 - Eleito Titular CIPA', TObject(8));
  cboMotivo.Items.AddObject('09 - Eleito Suplente CIPA', TObject(9));
  cboMotivo.Items.AddObject('10 - Membro do Conselho Nacional da Previdência Social (CNPS)', TObject(10));
  cboMotivo.Items.AddObject('11 - Membro de Comissão de Conciliação Prévia', TObject(11));
  cboMotivo.Items.AddObject('12 - Empregados eleitos diretores de sociedades cooperativas', TObject(12));
  cboMotivo.Items.AddObject('13 - Membros do Conselho Curador do FGTS', TObject(13));
  cboMotivo.Items.AddObject('99 - Outros', TObject(99));

  sel(-1);

  pIsExcluir   := False;
  pIsAlterar   := False;
end;

procedure TFrmCadRegEstabilidade.Sel(IdPessoa: double);
begin

  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa);
  
  CdsDet.Data := CtrlEstabilidade.ListGeral(IdPessoa);

end;

procedure TFrmCadRegEstabilidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlEstabilidade);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TFrmCadRegEstabilidade.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TFrmCadRegEstabilidade.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
  end;  
end;

function TFrmCadRegEstabilidade.GravarRegistro: boolean;
begin
  Result := CtrlEstabilidade.Gravar;
  if not(Result) then
    raise exception.Create(CtrlEstabilidade.MessageInfo);
end;

procedure TFrmCadRegEstabilidade.bbtnOkDetClick(Sender: TObject);
begin

  if not(ValidarCampos) then
  abort;

  if not pIsAlterar then
     CdsDet.Insert
  else
     CdsDet.Edit;

  CdsDet.FieldByName('IDPESSOA').asFloat      := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('DATAINICIO').AsString   := tmpDataInicio.text;
  CdsDet.FieldByName('DATAFIM').AsString      := tmpDataFim.text;
  CdsDet.FieldByName('OBSERVACAO').AsString   := dbmObs.text;
  CdsDet.FieldByName('MOTIVOESTAB').AsInteger := Integer(cboMotivo.Items.Objects[cboMotivo.ItemIndex]);
  CdsDet.FieldByName('MOTIVO').AsString       := Trim(cboMotivo.text);

  CdsDet.Post;
  dbgrdDet.RefreshDisplay;
  LimparCampos ;
  inherited;  
end;

procedure TFrmCadRegEstabilidade.bbtnConfirmarClick(Sender: TObject);
begin
  if (sbtnInsDet.Down) or (sbtnAltDet.down) then
  begin
   bbtnOkDet.Click ;
   bbtnVoltarDet.click;
  end;
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadRegEstabilidade.LimparCampos;
begin
  cboMotivo.ItemIndex  := -1;
  tmpDataInicio.Text   := EmptyStr;
  tmpDataFim.Text      := EmptyStr;
  dbmObs.Lines.Clear;
end;

procedure TFrmCadRegEstabilidade.sbtnInsDetClick(Sender: TObject);
begin
  LimparCampos;
  pIsExcluir := False;
  pIsAlterar := False;
  inherited;
end;

procedure TFrmCadRegEstabilidade.sbtnAltDetClick(Sender: TObject);
begin
  pIsAlterar   := True;
  pIsExcluir   := False;
  CarregaCamposAlteracao;
  inherited;

end;


procedure TFrmCadRegEstabilidade.sbtnExcluiDetClick(Sender: TObject);
begin
  pIsExcluir := True;
  pIsAlterar := False;
  inherited;
end;

procedure TFrmCadRegEstabilidade.CarregaCamposAlteracao;
begin
  if not (CdsDet.IsEmpty) then
  begin
    cboMotivo.ItemIndex  := cboMotivo.Items.IndexOfObject(TObject( CdsDet.FieldByName('MOTIVOESTAB').AsInteger));
    tmpDataInicio.Text   := CdsDet.FieldByName('DATAINICIO').AsString;
    tmpDataFim.Text      := CdsDet.FieldByName('DATAFIM').AsString;
    dbmObs.text          := CdsDet.FieldByName('OBSERVACAO').AsString;
  end;
end;

function TFrmCadRegEstabilidade.ValidarCampos: boolean;
begin

  result := false;

  if (tmpDataInicio.Text = '') then
  begin
    MsgDlg('Preencha a Data de Início', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tmpDataInicio.SetFocus;       
    Exit;
  end;

  if (cboMotivo.ItemIndex = -1) then
  begin
    MsgDlg('Preencha o Motivo da estabilidade', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    cboMotivo.SetFocus;
    Exit;
  end;

  if (tmpDataFim.Text <> '') and (tmpDataFim.DateTime < tmpDataInicio.DateTime) then
  begin
    MsgDlg('A Data Fim deve ser maior que a Data Início', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    tmpDataFim.SetFocus;
    Exit;
  end;

 result := true;
end;

procedure TFrmCadRegEstabilidade.cboMotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

end.

