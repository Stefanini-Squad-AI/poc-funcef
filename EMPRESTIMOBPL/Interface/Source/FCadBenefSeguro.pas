unit FCadBenefSeguro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Grids, Wwdbigrd, Wwdbgrid,
   DBTables, Wwquery, TREdit, UDatabase, Mask;

type
   TTipoOperacao = (toInclui, toAltera);

   TfrmCadBenefSeguro = class(TFrmOkCancelarImob)
      Label1: TLabel;
      edtInscricao: TEdit;
      Label2: TLabel;
      edtNomeMutuario: TEdit;
      qryDepen: TwwQuery;
      qryDepenNOME: TStringField;
      wwDBGrid1: TwwDBGrid;
      dsDepen: TDataSource;
      qryInsertBenef: TwwQuery;
      GroupBox1: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      edtNome: TEdit;
      edtPercentual: TRealEdit;
      Label8: TLabel;
      Label9: TLabel;
      memObs: TMemo;
      btnTransfere: TSpeedButton;
      qryUpdateBenef: TwwQuery;
      qryVerifica: TwwQuery;
      qryVerificaNOME: TStringField;
      qryVerificaPERCINDENIZACAO: TFloatField;
      edtBanco: TRealEdit;
      Label5: TLabel;
      Label6: TLabel;
      edtAgencia: TEdit;
      edtConta: TEdit;
      Label7: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      mskDDD: TEdit;
      mskTelefone: TEdit;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure btnTransfereClick(Sender: TObject);


   private  // Private declarations

      FIDTitular           : Int64;
      FIDMutuario          : Int64;
      FIDInscricaoEmptmo   : Extended;
      FNomeMutuario        : String;
      FIDBenefSeguro       : Int64;
      FNomeBeneficiario    : String;
      FCodBanco            : Real;
      FAgencia             : String;
      FContaCorrente       : String;
      FObservacao          : String;
      FPercentual          : Real;

      function VerificaDados(var sMsg : String) : Boolean;


   public   // Public declarations

      TipoOperacao     : TTipoOperacao;

      property IDTitular         : Int64    read FIDTitular         write FIDTitular;
      property IDMutuario        : Int64    read FIDMutuario        write FIDMutuario;
      property IDInscricaoEmptmo : Extended read FIDInscricaoEmptmo write FIDInscricaoEmptmo;
      property NomeMutuario      : String   read FNomeMutuario      write FNomeMutuario;
      property IDBenefSeguro     : Int64    read FIDBenefSeguro     write FIDBenefSeguro;
      property NomeBeneficiario  : String   read FNomeBeneficiario  write FNomeBeneficiario;
      property CodBanco          : Real     read FCodBanco          write FCodBanco;
      property Agencia           : String   read FAgencia           write FAgencia;
      property ContaCorrente     : String   read FContaCorrente     write FContaCorrente;
      property Observacao        : String   read FObservacao        write FObservacao;
      property Percentual        : Real     read FPercentual        write FPercentual;

   end;



var
  frmCadBenefSeguro: TfrmCadBenefSeguro;



implementation
{$R *.DFM}
uses
   UMensErro, UFuncoesEmptmo;



procedure TfrmCadBenefSeguro.FormShow(Sender: TObject);
begin
   inherited;

   LimpaParametros(qryDepen);
   qryDepen.ParamByName('PIDBENEF').AsInteger   := FIDMutuario;
   qryDepen.ParamByName('PIDTITULAR').AsInteger := FIDTitular;
   qryDepen.Open;

   edtInscricao.Text    := FormatFloat('0',FIDInscricaoEmptmo);
   edtNomeMutuario.Text := FNomeMutuario;

   edtNome.Clear;
   edtPercentual.Clear;
   edtAgencia.Clear;
   edtConta.Clear;
   edtBanco.Clear;
   memObs.Lines.Clear;

   if TipoOperacao = toAltera then
   begin
      edtNome.Text         := FNomeBeneficiario;
      edtPercentual.Value  := FPercentual;
      edtAgencia.Text      := FAgencia;
      edtConta.Text        := FContaCorrente;
      edtBanco.Value       := FCodBanco;

      mskDDD.Text          := trim(copy(FObservacao,  6,   5));
      mskTelefone.Text     := trim(copy(FObservacao, 11,   9));
      memObs.Text          := trim(copy(FObservacao, 25, 975));

      TipoOperacao         := toInclui;
   end;

   bHabilitaOk         := True;

   HabilitaBotoes;

   edtNome.SetFocus;
   bbtnSair.Enabled := True;
end;



procedure TfrmCadBenefSeguro.bbtnConfirmarClick(Sender: TObject);
var
   sMsg : String;
begin
   inherited;

   if edtNome.Text = '' then
   begin
      MsgDlg('Favor preencher o nome do beneficiário.', 'Empréstimo', mtWarning, [mbOk], 0);
      edtNome.SetFocus;
      Repaint;
      Exit;
   end;

   if edtPercentual.Value = 0 then
   begin
      MsgDlg('Favor preencher o percentual.', 'Empréstimo', mtWarning, [mbOk], 0);
      edtPercentual.SetFocus;
      Repaint;
      Exit;
   end;

   if edtPercentual.Value > 100 then
   begin
      MsgDlg('Percentual digitado não pode ultrapassar a 100%.', 'Empréstimo', mtWarning, [mbOk], 0);
      edtPercentual.SetFocus;
      Repaint;
      Exit;
   end;

   if not(VerificaDados(sMsg)) then
   begin
      MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   FIDBenefSeguro     := LeUltRegistro(nil, 'CONTRATOXBENEFSEG');
   FNomeBeneficiario  := edtNome.Text;
   FCodBanco          := edtBanco.Value;
   FAgencia           := edtAgencia.Text;
   FContaCorrente     := edtConta.Text;

   FObservacao        := 'tel. ' +
                         CompletaInicio(mskDDD.Text, ' ', 5)  +
                         CompletaInicio(mskTelefone.Text, ' ', 9) +
                         ' / ' + memObs.Text;

   FPercentual        := edtPercentual.Value;


   // if trunc(FPercentual) = 100 then
   Close;
end;


procedure TfrmCadBenefSeguro.btnTransfereClick(Sender: TObject);
begin
   inherited;
   edtNome.Text := qryDepenNOME.AsString;
   edtPercentual.SetFocus;
end;



function TfrmCadBenefSeguro.VerificaDados(var sMsg : String): Boolean;
var
    iTotal : Real;
begin
   Result := True;
   iTotal := 0;

   LimpaParametros(qryVerifica);
   qryVerifica.ParamByName('PIDINSCRICAOEMPTMO').AsFloat := FIDInscricaoEmptmo;
   qryVerifica.Open;

   while not(qryVerifica.EOF) do
   begin
      iTotal := iTotal + qryVerificaPERCINDENIZACAO.AsFloat;

      if TipoOperacao = toInclui then
      begin
         if qryVerificaNOME.AsString = edtNome.Text then
         begin
            sMsg := 'Beneficiário já cadastrado para essa inscrição';
            Result := False;
            Exit;
         end;
      end;

      if (iTotal + edtPercentual.Value) > 100 then
      begin
         sMsg := 'Total de Percentual ultrapassa os 100%';
         Result := False;
         Exit;
      end;

      qryVerifica.Next;
   end;
end;



end.
