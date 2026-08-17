unit FExecProrrogacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, wwdbedit, StdCtrls, Mask, DBCtrls, DBCtrls2,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, FOkCancelarImob;

type
  TfrmExecProrrogacao = class(TFrmOkCancelarImob)
    dsContrato: TwwDataSource;
    Label5: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    DBedtNomeContrato: TDBEdit2;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtNovaData: TCMDateTimePicker;
    btnBuscaContrato: TBitBtn;

    procedure btnBuscaContratoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private { Private declarations }
    iContrato: integer;
    sFiltroOriginal : string;  // filtro original do MS_Contrato

    procedure AbreQueries(const iContrato: integer);
    function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;


var
  frmExecProrrogacao: TfrmExecProrrogacao;


implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, uEventoImovel,
   dImobiliario, UFuncoesImob, dLookImobiliario, UComunsImobiliario, uVerificaPreenchimento,
  DMS;



function TfrmExecProrrogacao.VerificaPreenchimento: boolean;
begin

   Result := False;
   try

      if length(trim(DBedtNomeContrato.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', btnBuscaContrato);

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecProrrogacao.AbreQueries(const iContrato: integer);
begin
   LimpaParametros(dtmImobiliario.qryContratosReajuste);
   dtmImobiliario.qryContratosReajuste.ParamByName('EMPRESAPROP').AsInteger := Sistema.IdEmpresa;
   dtmImobiliario.qryContratosReajuste.ParamByName('CONTRATO').AsInteger    := iContrato;
   dtmImobiliario.qryContratosReajuste.Open;
end;



procedure TfrmExecProrrogacao.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Contrato.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query principal com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin
      Screen.Cursor := crDefault;

      iContrato := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      AbreQueries(iContrato);

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecProrrogacao.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if VerificaPreenchimento then begin

      try
         if EventoImovel.ProrrogaContrato(iContrato, Date, edtNovaData.Date, True) = 0 then begin
            CommitTransacao;
            dtmImobiliario.qryContratosReajuste.Close;
         end else begin
            RollBackTransacao;
         end;
      except
         RollBackTransacao;
      end;
   end;
end;



procedure TfrmExecProrrogacao.FormCreate(Sender: TObject);
begin
   inherited;

   iContrato := -1;
   sFiltroOriginal   := dtmMS.MS_Contrato.Filtro.Text;

   dtmMS.MS_Contrato.Filtro.Add('IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   dtmMS.MS_Contrato.Filtro.Add('(C.CONDATAFIM > TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'')) OR (C.FLGINDETERMINADO = ''S'')');
end;



procedure TfrmExecProrrogacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   dtmMS.MS_Contrato.Filtro.Text := sFiltroOriginal;
   dtmImobiliario.qryContratosReajuste.Close;
end;



end.
