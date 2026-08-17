// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 04.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelBeneficios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, DRelatAdmPrev;

type
  TfrmParamRelBeneficios = class(TfrmOkCancelar)
    MontaSelect: TMontaSelect;
    edNumProcesso: TEdit;
    edParticipante: TEdit;
    edMatricula: TEdit;
    edNumInsc: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edPatrocinadora: TEdit;
    edPlano: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    bbtnProcurar: TBitBtn;
    chkImprimirLog: TCheckBox;
    chkExibirReserva: TCheckBox;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sIdPessoa, sNumeroProcesso : string;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmParamRelBeneficios: TfrmParamRelBeneficios;

implementation

uses DRelatorios, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelBeneficios.LimpaCampos;
begin
   edNumProcesso.Text   := '';
   edParticipante.Text  := '';
   edMatricula.Text     := '';
   edPatrocinadora.Text := '';
   edNumInsc.Text       := '';
   edPlano.Text         := '';
   sIdPessoa            := '-1';
   sNumeroProcesso      := '-1';
end;

procedure TfrmParamRelBeneficios.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     sNumeroProcesso      := MontaSelect.ValoresChave[0];
     edNumProcesso.Text   := MontaSelect.ValoresChave[0];
     sIdPessoa            := MontaSelect.ValoresChave[1];
     edParticipante.Text  := MontaSelect.ValoresChave[2];
     edMatricula.Text     := MontaSelect.ValoresChave[3];
     edPatrocinadora.Text := MontaSelect.ValoresChave[4];
     edNumInsc.Text       := MontaSelect.ValoresChave[5];
     edPlano.Text         := MontaSelect.ValoresChave[6];

     if MontaSelect.ValoresChave[7] = 'CD'
     then begin
        chkExibirReserva.Visible := True;
        chkExibirReserva.Checked := True;
     end
     else chkExibirReserva.Visible := False;
  end
  else LimpaCampos;
end;

procedure TfrmParamRelBeneficios.FormShow(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

procedure TfrmParamRelBeneficios.bbtnConfirmarClick(Sender: TObject);

begin
  if Trim(edNumProcesso.Text) = ''
  then begin
     MsgDlg('Selecione o Processo','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  with dtmRelatAdmPrev do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     qryRelBeneficios.Close;
     qryRelBeneficios.ParamByName('IdPessoa').AsInteger := StrToInt(sIdPessoa);
     qryRelBeneficios.ParamByName('NumeroProcesso').AsInteger := StrToInt(sNumeroProcesso);
     qryRelBeneficios.Open;

     qryReserva.Close;
     qryReserva.ParamByName('IdPessJur').AsInteger    := qryRelBeneficios.FieldByName('IdPessJur').AsInteger;
     qryReserva.ParamByName('IdPlanoPrev').AsInteger  := qryRelBeneficios.FieldByName('IdPlanoPrev').AsInteger;
     qryReserva.ParamByName('IdPessoa').AsInteger     := qryRelBeneficios.FieldByName('IdPessoa').AsInteger;
     qryReserva.ParamByName('SeqProposta').AsInteger  := qryRelBeneficios.FieldByName('SeqProposta').AsInteger;
     qryReserva.ParamByName('DataInicio').AsString    := qryRelBeneficios.FieldByName('DataInicioFund').AsString;
     qryReserva.ParamByName('NumeroProcesso').AsInteger := qryRelBeneficios.FieldByName('NumeroProcesso').AsInteger;
     qryReserva.Open;

     if chkImprimirLog.Checked
     then begin
        qryMovBenef.Close;
        qryMovBenef.ParamByName('NumeroProcesso').AsInteger := StrToInt(sNumeroProcesso);
        qryMovBenef.Open;
        ppRelBenefSubLog.Visible := True;
     end
     else ppRelBenefSubLog.Visible := False;

     if chkExibirReserva.Visible and chkExibirReserva.Checked
     then ppSubRelReserva.Visible := True
     else ppSubRelReserva.Visible := False;
  end;

  inherited;
end;

end.
