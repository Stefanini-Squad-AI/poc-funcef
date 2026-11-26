unit fParamBostonEscrituralMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro;

type
  TfrmParamBostonEscrituralMT = class(TForm)
    pnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    cbxCarteira: TComboBox;
    edtNumeroDias: TRealEdit;
    edtMensagem: TEdit;
    Label1: TLabel;
    dbrgIdent: TRadioGroup;
    Label3: TLabel;
    edtConvenio: TRealEdit;
    cbxOcorrencia: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    cbxCodIdent: TComboBox;
    Label10: TLabel;
    cbxInstrucao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
    procedure cbxInstrucaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBostonEscrituralMT: TfrmParamBostonEscrituralMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamBostonEscrituralMT.FormCreate(Sender: TObject);
Begin
  edtConvenio.Value       := StrToFloat(IntBancoManager.BuscaParamIntBanco('CONVENIO','N'));
  cbxCarteira.ItemIndex   := StrToInt(IntBancoManager.BuscaParamIntBanco('CARTEIRA','N'));
  cbxInstrucao.ItemIndex  := StrToInt(IntBancoManager.BuscaParamIntBanco('INSTRUCAO','N'));
  edtNumeroDias.Text      := IntBancoManager.BuscaParamIntBanco('NUMDIASPROTESTO','N');
  edtMensagem.Text        := IntBancoManager.BuscaParamIntBanco('MENSAGEM','S');
  if StrToInt(IntBancoManager.BuscaParamIntBanco('DIAS','N')) <> 0 then
  begin
    edtNumeroDias.Value   := StrToInt(IntBancoManager.BuscaParamIntBanco('DIAS','N'));
    edtNumeroDias.Color   := clWindow;
    edtNumeroDias.Enabled := True;
  end;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = ''   then cbxOcorrencia.ItemIndex := 0;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '01' then cbxOcorrencia.ItemIndex := 0;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '02' then cbxOcorrencia.ItemIndex := 1;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '04' then cbxOcorrencia.ItemIndex := 2;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '05' then cbxOcorrencia.ItemIndex := 3;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '06' then cbxOcorrencia.ItemIndex := 4;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '08' then cbxOcorrencia.ItemIndex := 5;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '09' then cbxOcorrencia.ItemIndex := 6;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '10' then cbxOcorrencia.ItemIndex := 7;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '11' then cbxOcorrencia.ItemIndex := 8;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '12' then cbxOcorrencia.ItemIndex := 9;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '14' then cbxOcorrencia.ItemIndex := 10;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '18' then cbxOcorrencia.ItemIndex := 11;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '71' then cbxOcorrencia.ItemIndex := 12;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '72' then cbxOcorrencia.ItemIndex := 13;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '73' then cbxOcorrencia.ItemIndex := 14;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '74' then cbxOcorrencia.ItemIndex := 15;
  if Trim(IntBancoManager.BuscaParamIntBanco('OCORRENCIA','S')) = '75' then cbxOcorrencia.ItemIndex := 16;


  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = ''   then cbxCodIdent.ItemIndex := 0;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'DM' then cbxCodIdent.ItemIndex := 0;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'DS' then cbxCodIdent.ItemIndex := 1;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'NS' then cbxCodIdent.ItemIndex := 2;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'RE' then cbxCodIdent.ItemIndex := 3;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'RS' then cbxCodIdent.ItemIndex := 4;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'RC' then cbxCodIdent.ItemIndex := 5;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'ND' then cbxCodIdent.ItemIndex := 6;
  if Trim(IntBancoManager.BuscaParamIntBanco('CODIDENTTIT','S')) = 'OT' then cbxCodIdent.ItemIndex := 7;
  if IntBancoManager.BuscaParamIntBanco('ACEITE','S') = 'N' then
     dbrgIdent.ItemIndex := 1
  else
     dbrgIdent.ItemIndex := 0;
end;






procedure TfrmParamBostonEscrituralMT.CMOkCancelar1OkClick(Sender: TObject);
var
Carteira, CampoAceito, Ocorrencia, NumeroConvenio, qtdDias :String;

begin
  if trim(cbxCarteira.Text) = ''  then
  begin
    MsgDlg('Informe o Tipo de Carteira.','Aviso...',mtError,[mbOk],0);
    Exit;
  end;
  if dbrgIdent.ItemIndex = 0 then
     CampoAceito := 'A'
  else
     CampoAceito := 'N';

  Carteira          := IntToStr(cbxCarteira.ItemIndex);
  NumeroConvenio    := FloatToStr(edtConvenio.Value);
  qtdDias           := FloatToStr(edtNumeroDias.Value);
  Case cbxOcorrencia.ItemIndex of
     0:  Ocorrencia := '01';
     1:  Ocorrencia := '02';
     2:  Ocorrencia := '04';
     3:  Ocorrencia := '05';
     4:  Ocorrencia := '06';
     5:  Ocorrencia := '08';
     6:  Ocorrencia := '09';
     7:  Ocorrencia := '10';
     8:  Ocorrencia := '11';
     9:  Ocorrencia := '12';
     10: Ocorrencia := '14';
     11: Ocorrencia := '18';
     12: Ocorrencia := '71';
     13: Ocorrencia := '72';
     14: Ocorrencia := '73';
     15: Ocorrencia := '74';
     16: Ocorrencia := '75';
  end;
  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'CONVENIO',
                                 'OCORRENCIA',
                                 'CODIDENTTIT',
                                 'INSTRUCAO',
                                 'MENSAGEM',
                                 'DIAS',
                                 'ACEITE'],
                                 [CARTEIRA,
                                  NumeroConvenio,
                                  OCORRENCIA,
                                  COPY(cbxCodIdent.Text,1,2),
                                  COPY(cbxInstrucao.Text,1,2),
                                  edtMensagem.Text,
                                  qtdDias,
                                  CampoAceito]);
  ModalResult := MrOk;
end;

procedure TfrmParamBostonEscrituralMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


procedure TfrmParamBostonEscrituralMT.cbxInstrucaoClick(Sender: TObject);
begin
  if (cbxInstrucao.ItemIndex = 1) or (cbxInstrucao.ItemIndex = 3) then
  begin
    edtNumeroDias.Color   := clWhite;
    edtNumeroDias.Enabled := True;
  end
  else
  begin
    edtNumeroDias.Color   := clSilver;
    edtNumeroDias.Enabled := False;
    edtNumeroDias.Value   := 0;
  end;
end;

end.
