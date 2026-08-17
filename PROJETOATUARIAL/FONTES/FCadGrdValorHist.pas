{===============================================================================
Unit    :  FCadGrdValorHist
Form    :  frmCadGrdValorHist

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/08/2000

Objetivo: Consultar Valores da Base de Histórico.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadGrdValorHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, wwdblook, Mask,
  MontaSelect, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadGrdValorHist = class(TfrmCadastroGrid)
    Label8: TLabel;
    LkcTbTipoValor: TwwDBLookupCombo;
    Label4: TLabel;
    qryTipoValor: TwwQuery;
    dsTipoValor: TwwDataSource;
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryTipoValorCD_TIPO_VALOR: TFloatField;
    qryTipoValorDS_TIPO_VALOR: TStringField;
    EdtValor: TEdit;
    qryPrincipalDS_TIPO_VALOR: TStringField;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_TIPO_VALOR: TFloatField;
    qryPrincipalVL_PARTICIPANTE: TFloatField;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrdValorHist: TfrmCadGrdValorHist;
  wIdReg: Integer;

implementation

uses uFuncGerais, uParticipanteHist;

{$R *.DFM}

procedure TfrmCadGrdValorHist.FormCreate(Sender: TObject);
begin
  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipanteHist.Participante;
  inherited;
  qryTipoValor.Open;
end;

procedure TfrmCadGrdValorHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoValor.Close;
end;

procedure TfrmCadGrdValorHist.sbtnAlterarClick(Sender: TObject);
begin
  EdtValor.text := qryPrincipal.FieldByName('VL_PARTICIPANTE').asString;
  inherited;
  LkcTbTipoValor.Enabled := false;
end;

procedure TfrmCadGrdValorHist.sbtnInserirClick(Sender: TObject);
begin
  EdtValor.text := '';
  inherited;
  LkcTbTipoValor.Enabled := true;
end;

procedure TfrmCadGrdValorHist.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(LkcTbTipoValor.Text) =  '' then
   begin
     ShowMessage('Informe o Tipo de Valor');
     LkcTbTipoValor.SetFocus;
     exit;
   end;
  EdtValor.text := FormataFloat(EdtValor.text);
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmCadGrdValorHist.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadGrdValorHist.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipanteHist.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
   end;
  if trim(EdtValor.text) = '' then
    EdtValor.text := '0'; 
  qryPrincipal.FieldByName('VL_PARTICIPANTE').AsFloat := StrToFloat(EdtValor.text); 


  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_TIPO_VALOR').AsInteger;
end;

procedure TfrmCadGrdValorHist.qryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmCadGrdValorHist.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_TIPO_VALOR',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmCadGrdValorHist.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO;CD_PARTIC;CD_TIPO_VALOR', VarArrayOf([StrToInt(MontaSelect.ValoresChave[0]),
                       StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2])]), []);

  sbtnProcurar.Down := False;
end;

end.
