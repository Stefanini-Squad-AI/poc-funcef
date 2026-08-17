{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit FExecGeraArquivoMargem13;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Menus, Db, DBTables, Wwquery, ComCtrls,
   wwriched, wwdbdatetimepicker, CMDateTimePicker, mMutuario;

type
   TfrmExecGeraArquivoMargem13 = class(TfrmOkCancelar)
      Label1: TLabel;
      SpeedButton1: TSpeedButton;
      edtNomeArquivo: TEdit;
      OpenDialog: TOpenDialog;
      Label2: TLabel;
      SpeedButton2: TSpeedButton;
      Label3: TLabel;
      qryParticipante: TwwQuery;
      qryParticipanteIDPESSJUR: TFloatField;
      qryParticipanteMATRICULA: TStringField;
      qryParticipanteIDPLANOPREV: TFloatField;
      qryParticipanteIDTITULAR: TFloatField;
      qryParticipanteIDPESSOA: TFloatField;
      qryParticipanteIDSITPART: TFloatField;
      molMutuario: TmolMutuario;

      procedure FormCreate(Sender: TObject);
      procedure SpeedButton2Click(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
    procedure molMutuariobtnBuscaPartClick(Sender: TObject);
    procedure molMutuariobtnLimpaPartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


   private

      fSalMantido       : Currency;
      fSalAuxDoenca     : Currency;
      fSalBenef         : Currency;
      fSalParticipacao  : Currency;

      function  Salario(IDTitular, IDPessoa, IDPlano: Integer): Currency;  // Private declarations


   public   // Public declarations


   end;



var
  frmExecGeraArquivoMargem13: TfrmExecGeraArquivoMargem13;



implementation
{$R *.DFM}
uses
   uTypesEmptmo, uFuncoesEmptmo, UDataBase, dBaseDados, UMensErro, USistema, fProgresso, uCalcEmptmo;



procedure TfrmExecGeraArquivoMargem13.FormCreate(Sender: TObject);
begin
   inherited;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //edtNomeArquivo.Text := Sistema.TempDir + 'EP-ArquivoMargem13-' + FormatDateTime('yyyy-mm-dd', SysDate) + '.TXT';
   edtNomeArquivo.Text := ftempregra + '\' + 'EP-ArquivoMargem13-' + FormatDateTime('yyyy-mm-dd', SysDate) + '.TXT';
   OpenDialog.FileName := edtNomeArquivo.Text;
end;



procedure TfrmExecGeraArquivoMargem13.SpeedButton2Click(Sender: TObject);
begin
   inherited;
   if OpenDialog.Execute then edtNomeArquivo.Text := OpenDialog.FileName;
end;




procedure TfrmExecGeraArquivoMargem13.bbtnConfirmarClick(Sender: TObject);
var
   Arquivo     : TextFile;

   fSalario    : Currency;
   fMargem     : Currency;
   fReserva    : Currency;
   fTxJuros    : Currency;

   fVlrBase1   : Currency;
   fVlrBase2   : Currency;

   iContador   : Integer;

   sIDPessjur  : String;
   sMatricula  : String;
   sMargem     : String;
   sLinha      : String;

   rContrato   : TDadosContrato;

   //Pendência 26951 - 06/11/2007
   aListaContrato : array of Extended;

begin
   inherited;

   SetLength(aListaContrato, 0);
   //Fim Pendência 26951

   if edtNomeArquivo.Text = '' then
   begin
      MsgDlg('Favor informar o arquivo.', 'Aviso', mtWarning, [mbOK], 0);
      Repaint;
      Exit;
   end;

   AssignFile(Arquivo, edtNomeArquivo.Text);
   ReWrite(Arquivo);

   MostraEspera('Selecionando Participantes. Aguarde...');
   Application.ProcessMessages;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   with qryParticipante do
   begin
      LimpaParametros(qryParticipante);
      if molMutuario.IDBenef > 0 then ParamByName('PIDBENEF').AsFloat := molMutuario.IDBenef;
      Open;
   end;

   // ----------------------------------------------------------------------------------------------

   Application.ProcessMessages;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   iContador := 0;

   EscondeEspera;

   Application.ProcessMessages;
   Repaint;

   frmProgresso.MostraFormProgresso('Calculando Margens...',
                                    True,
                                    True,
                                    True,
                                    0,
                                    qryParticipante.RecordCount
                                   );

   Application.ProcessMessages;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   qryParticipante.First;
   while not(qryParticipante.EOF) do
   begin
      if frmProgresso.Cancelou then
      begin
         MsgDlg('Processo interrompido pelo usuário.', 'Empréstimo', mtInformation, [mbOK], 0);
         Repaint;
         Break;
      end;

      // -------------------------------------------------------------------------------------------

      sIDPessjur  := FormatFloat('#0', qryParticipanteIDPESSJUR.asFloat);
      sMatricula  := qryParticipanteMATRICULA.AsString;

      try
         try
            // -------------------------------------------------------------------------------------

            try
               fSalario := Salario(qryParticipanteIDTITULAR.AsInteger,
                                   qryParticipanteIDPESSOA.AsInteger,
                                   qryParticipanteIDPLANOPREV.AsInteger
                                  );
            except
               fSalario := 0;
            end;

            // -------------------------------------------------------------------------------------
            try
               fReserva := CalcEmptmo.BuscaReserva(qryParticipanteIDPESSOA.AsInteger,
                                                   qryParticipanteIDPESSJUR.AsInteger,
                                                   qryParticipanteIDPLANOPREV.AsInteger,
                                                   2534,
                                                   Sysdate,
                                                   False,
                                                   1
                                                  );
            except
               fReserva := 0
            end;

            // -------------------------------------------------------------------------------------

            fMargem := 0;

            // -------------------------------------------------------------------------------------

            LimpaRegistroContrato(rContrato);

            rContrato.IDPatro          := qryParticipanteIDPESSJUR.AsInteger;
            rContrato.IDPlanoPrev      := qryParticipanteIDPLANOPREV.AsInteger;
            rContrato.IDBenef          := qryParticipanteIDPESSOA.AsInteger;
            rContrato.IDPessoa         := qryParticipanteIDTITULAR.AsInteger;
            rContrato.NumParcelas      := 1;
            rContrato.VlrContrato      := 0;
            rContrato.SiglaIndexador   := 'INPC';

            // -------------------------------------------------------------------------------------

            fTxJuros := 0;

            // -------------------------------------------------------------------------------------

            case qryParticipanteIDPLANOPREV.AsInteger of
               2  : rContrato.IDTipoContrEmptmo := 11;
               19 : rContrato.IDTipoContrEmptmo := 12;
               66 : rContrato.IDTipoContrEmptmo := 13;
            end;

            try
               fVlrBase1 := CalcEmptmo.BuscaVlrSolicMax(rContrato,
                                                        qryParticipanteIDSITPART.AsInteger,
                                                        fTxJuros,
                                                        fMargem,
                                                        fReserva,
                                                        0,
                                                        0,
                                                        fSalParticipacao,
                                                        fSalMantido,
                                                        fSalAuxDoenca,
                                                        fSalBenef,
                                                        fSalario,
                                                        False,
                                                        //Pendência 26951 - 06/11/2007
                                                        aListaContrato,
                                                        //Fim Pendência 26951
                                                        1
                                                       );
            except
               fVlrBase1 := 0;
            end;

            // -------------------------------------------------------------------------------------

            case qryParticipanteIDPLANOPREV.AsInteger of
               2  : rContrato.IDTipoContrEmptmo := 14;
               19 : rContrato.IDTipoContrEmptmo := 15;
               66 : rContrato.IDTipoContrEmptmo := 16;
            end;

            try
               fVlrBase2 := CalcEmptmo.BuscaVlrSolicMax(rContrato,
                                                        qryParticipanteIDSITPART.AsInteger,
                                                        fTxJuros,
                                                        fMargem,
                                                        fReserva,
                                                        0,
                                                        0,
                                                        fSalParticipacao,
                                                        fSalMantido,
                                                        fSalAuxDoenca,
                                                        fSalBenef,
                                                        fSalario,
                                                        False,
                                                        //Pendência 26951 - 06/11/2007
                                                        aListaContrato,
                                                        //Fim Pendência 26951
                                                        1
                                                       );
            except
               fVlrBase2 := 0;
            end;

            // -------------------------------------------------------------------------------------

            sLinha  := sIDPessjur + '^' + sMatricula + '^' +
                       NumeroIngles(fVlrBase1) + '^' +
                       NumeroIngles(fVlrBase2);

            // -------------------------------------------------------------------------------------
         except
            sLinha  := sIDPessjur + '^' + sMatricula + '^' + '0' + '^' + '0';
         end;

      finally
         WriteLn(Arquivo, sLinha);
      end;

      // -------------------------------------------------------------------------------------------

      qryParticipante.Next;

      inc(iContador);
      frmProgresso.AndaFormProgresso(iContador);
   end;

   // ----------------------------------------------------------------------------------------------

   frmProgresso.EscondeFormProgresso;

   CloseFile(Arquivo);
   qryParticipante.Close;
end;



function  TfrmExecGeraArquivoMargem13.Salario(IDTitular  : Integer;
                                              IDPessoa   : Integer;
                                              IDPlano    : Integer
                                             ): Currency;
var
   fSalario : Currency;
begin
   fSalario := 0;

   try
      // -------------------------------------------------------------------------------------------
      fSalario := CalcEmptmo.BuscaSalarioBase(6312,
                                              IDTitular,
                                              IDPessoa,
                                              fSalParticipacao,
                                              fSalMantido,
                                              fSalAuxDoenca,
                                              fSalBenef,
                                              True,
                                              Sysdate,
                                              1
                                             );
      // -------------------------------------------------------------------------------------------
   except
   end;

   Result := fSalario;
end;



procedure TfrmExecGeraArquivoMargem13.molMutuariobtnBuscaPartClick(Sender: TObject);
begin
   inherited;
   //
end;



procedure TfrmExecGeraArquivoMargem13.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   //
end;



procedure TfrmExecGeraArquivoMargem13.FormShow(Sender: TObject);
begin
   inherited;
   molMutuariobtnLimpaPartClick(self);
end;



end.
