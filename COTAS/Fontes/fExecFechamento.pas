//************************************************************************************************//
// Data      : 26/01/2007
// Código    : AL_1
// Pendencia : 22362
// SOL       : 43207
// Descrição : Retirando a variável com "array" de idativos das queries, nenhum banco faz a
//              cláusula IN com mais de 1000 itens
//************************************************************************************************//
unit fExecFechamento;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
   wwdbdatetimepicker, CMDateTimePicker,
   uCtrlCotaCotacao, wwriched;

type
   TfrmExecFechamento = class(TfrmWizardMT)
      grpCalculo: TGroupBox;
      Label1: TLabel;
      chkManual: TCheckBox;
      chkEP: TCheckBox;
      chkImob: TCheckBox;
      chkRF: TCheckBox;
      chkRV: TCheckBox;
      chkBMF: TCheckBox;
      Label2: TLabel;
      chkFundoRF: TCheckBox;
      chkFundoRV: TCheckBox;
      chkFundoImob: TCheckBox;
      chkFundoDIC: TCheckBox;
      edtDataFim: TCMDateTimePicker;
      Label3: TLabel;
      btnInvertePlano: TBitBtn;
      btnMarcaTodosPlano: TBitBtn;
      Label5: TLabel;
      memResult: TwwDBRichEdit;

      procedure FormCreate(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);
      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);

   private  // Private declarations

      CtrlCotaCotacao   : TCtrlCotaCotacao;

      function  VerificaPreenchimento: Boolean;


   public   // Public declarations

      procedure Progresso(vParam : Array of Variant);


   end;

var
  frmExecFechamento: TfrmExecFechamento;

implementation
{$R *.DFM}
uses
   dBaseDados, uSistema, uMensErro, uVerificaPreenchimento, fProgressoDuplo, FProgresso;

procedure TfrmExecFechamento.Progresso(vParam : Array of Variant);
begin
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//   vParam[2] :  Mínimo de Registros  (em cima)
//   vParam[3] :  Total de Registros   (em cima)
//   vParam[4] :  Registro Atual       (em cima)
//   vParam[5] :  Legenda              (em cima)

//   vParam[6] :  Mínimo de Registros  (em baixo)
//   vParam[7] :  Total de Registros   (em baixo)
//   vParam[8] :  Registro Atual       (em baixo)
//   vParam[9] :  Legenda              (em baixo)
//   vParam(10]:  Retorno de mensagem/resultado


   case vParam[1] of
      // -------------------------------------------------------------------------------------------
      0:
      begin
         frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5],  // Legenda  (de cima)
                                                    vParam[9],  // Legenda  (de baixo)
                                                    vParam[2],  // Mínimo   (de cima)
                                                    vParam[6],  // Mínimo   (de baixo)
                                                    vParam[3],  // Máximo   (de cima)
                                                    vParam[7],  // Máximo   (de baixo)
                                                    False,      // Botão Visivel
                                                    False       // Botão Habilitado
                                                   );

         if length(trim(vParam[10])) > 0 then
         begin
            memResult.Lines.Add(vParam[10]);
         end;
      end;
      // -------------------------------------------------------------------------------------------
      1:
      begin
         frmProgressoDuplo.AndaFormProgressoDuplo(vParam[4], vParam[8]);

         if length(trim(vParam[10])) > 0 then
         begin
            memResult.Lines.Add(vParam[10]);
         end;
      end;
      // -------------------------------------------------------------------------------------------
      2:
      begin
         frmProgressoDuplo.EscondeFormProgressoDuplo;

         if length(trim(vParam[10])) > 0 then
         begin
            memResult.Lines.Add(vParam[10]);
         end;
      end;
      // -------------------------------------------------------------------------------------------
   end;

   Application.ProcessMessages;
end;

function  TfrmExecFechamento.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      if length(trim(edtDataFim.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data até quando calcular as Cotas!', edtDataFim);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;

procedure TfrmExecFechamento.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

   CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True, nil, nil, False
                             );

   CtrlCotaCotacao.Progresso  := Progresso;
end;

procedure TfrmExecFechamento.btnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   chkEP.Checked        := not(chkEP.Checked);
   chkImob.Checked      := not(chkImob.Checked);
   chkRF.Checked        := not(chkRF.Checked);
   chkRV.Checked        := not(chkRV.Checked);
   chkFundoRF.Checked   := not(chkFundoRF.Checked);
   chkFundoRV.Checked   := not(chkFundoRV.Checked);
   chkFundoImob.Checked := not(chkFundoImob.Checked);
   chkFundoDIC.Checked  := not(chkFundoDIC.Checked);
end;

procedure TfrmExecFechamento.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;

   chkManual.Checked    := True;
   chkEP.Checked        := True;
   chkImob.Checked      := True;
   chkRF.Checked        := True;
   chkRV.Checked        := True;
   chkFundoRF.Checked   := True;
   chkFundoRV.Checked   := True;
   chkFundoImob.Checked := True;
   chkFundoDIC.Checked  := True;
end;

procedure TfrmExecFechamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FreeAndNil(CtrlCotaCotacao);
end;

procedure TfrmExecFechamento.btnContinuarClick(Sender: TObject);
begin
   if VerificaPreenchimento then
   begin
      try
         memResult.Clear;
         memResult.Lines.Add(FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ' + ' Início do cálculo de cotas ' + #13 + #13);

         CtrlCotaCotacao.CreateThreadProgresso;

         if not(CtrlCotaCotacao.ProcessaCotaModulos(edtDataFim.Date,
                                                    chkManual.Checked,
                                                    chkEP.Checked,
                                                    chkImob.Checked,
                                                    chkRF.Checked,
                                                    chkRV.Checked,
                                                    chkBMF.Checked,
                                                    chkFundoRF.Checked,
                                                    chkFundoRV.Checked,
                                                    chkFundoImob.Checked,
                                                    chkFundoDIC.Checked,
                                                    True,
                                                    CtrlCotaCotacao.ProgressFileName,
                                                    //AL_1
                                                    nil, // Ativos
                                                    -1, // Plano
                                                    -1  // Patro
                                                   )) then
         begin
            MsgDlg(CtrlCotaCotacao.MessageInfo, 'Cotas', mtError, [mbOk], 0);
            Repaint;

            Exit;
         end;

      finally
         CtrlCotaCotacao.FreeThreadProgresso;
         memResult.Lines.Add(#13 + #13 + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ' + 'Término do cálculo de cotas ');
      end;


      inherited;
   end;
end;

end.
