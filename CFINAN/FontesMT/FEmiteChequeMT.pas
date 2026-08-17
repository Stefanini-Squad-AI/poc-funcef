unit FEmiteChequeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, uExtensoCM, ComPort, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, uGImp,
  uImpressoraFical, uGeralFinanc;

type
  TfrmEmiteChequeMT = class(TfrmOkCancelar)
    Label1: TLabel;
    dblcModeloCheque: TwwDBLookupCombo;
    labelfavorecido: TLabel;
    edFavorecido: TEdit;
    Label5: TLabel;
    edLocalEmissCheque: TEdit;
    Label10: TLabel;
    edLocalDiferido: TEdit;
    Label4: TLabel;
    DtEmis: TCMDateTimePicker;
    Label9: TLabel;
    DtDiferido: TCMDateTimePicker;
    Label2: TLabel;
    edNumChq: TRealEdit;
    pgcCheque: TPageControl;
    tbsImpressoraCheque: TTabSheet;
    GpMaqCheque: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    CmbModelo: TComboBox;
    ComboBoxDeviceName: TComboBox;
    CkbMaquina: TCheckBox;
    tbsVersoCheque: TTabSheet;
    lblLinha: TLabel;
    CkbVersoCheque: TCheckBox;
    memVersoCheque: TMemo;
    GImpCheque: TGImp;
    Extenso: TExtensoCM;
    cdsModeloCheque: TCMClientDataSet;
    sqlpModeloCheque: TCMSqlParams;
    sqlpTesteCheque: TCMSqlParams;
    cdsTesteCheque: TCMClientDataSet;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcModeloChequeChange(Sender: TObject);
    procedure CkbMaquinaClick(Sender: TObject);
    procedure CkbVersoChequeClick(Sender: TObject);
    procedure ComboBoxDeviceNameChange(Sender: TObject);


  private { Private declarations }

    CmCheque        : TCmImpressoraFiscal;
    rValorAux       : Double;
    rCodPortadorAux : Double;
    sCodBancoAux    : String;
    GeralFinanc     : TGeralFinanc;

    procedure ImprimeFrenteCheque;
    function ImprimeVersoCheque:Boolean;
    function TestaCheque(Gravar: Boolean): Boolean;


  public  { Public declarations }

    constructor Create(AOwner: TComponent; rValor,rCodPortador: Double; sCodBanco: String); reintroduce;


  end;



var
  frmEmiteChequeMT: TfrmEmiteChequeMT;



implementation
{$R *.DFM}
uses
  uMensErro, uSistema, dBaseDados, uCtrlTalaoCheque, UCheqBloqMT ;



constructor TfrmEmiteChequeMT.Create(AOwner: TComponent; rValor, rCodPortador: Double; sCodBanco: String);
begin
   inherited Create(AOwner);
   rCodPortadorAux:=rCodPortador;
   rValorAux:=rValor;
   sCodBancoAux:=sCodBanco;
end;



procedure TfrmEmiteChequeMT.FormCreate(Sender: TObject);
begin
   inherited;
   GeralFinanc:=TGeralFinanc.Create;
   GeralFinanc.Initialize(dtmBaseDados.dbBaseDados,True);
   sqlpModeloCheque.Prepare;
   sqlpModeloCheque.Open;

   ComboBoxDeviceName.itemIndex := 0;
   CmCheque := TCmImpressoraFiscal.Create(self);
   CmbModelo.Items.Text := CmCheque.ModelosImpressoras;
   CmbModelo.ItemIndex:=0;
   DtEmis.Date:=Now;
end;



procedure TfrmEmiteChequeMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GeralFinanc.Free;
  CmCheque.free;
end;



procedure TfrmEmiteChequeMT.dblcModeloChequeChange(Sender: TObject);
begin
   case CmbModelo.ItemIndex of
      0:CmCheque.NomeImpFiscal := niChronos_ACC100;
      1:CmCheque.NomeImpFiscal := niChronos_ACC300;
      2:CmCheque.NomeImpFiscal := NSC_201;
      3:CmCheque.NomeImpFiscal := NSC_218;
   end;
end;



procedure TfrmEmiteChequeMT.CkbMaquinaClick(Sender: TObject);
begin
   GpMaqCheque.Enabled:=CkbMaquina.Checked;
   if GpMaqCheque.Enabled then CmbModelo.SetFocus;
end;



procedure TfrmEmiteChequeMT.CkbVersoChequeClick(Sender: TObject);
begin
   memVersoCheque.Enabled:=CkbVersoCheque.Checked;
   if memVersoCheque.Enabled then memVersoCheque.SetFocus;
end;



procedure TfrmEmiteChequeMT.bbtnConfirmarClick(Sender: TObject);
var
   iLinha       : Integer;
   iNumLinhas   : Integer;
   sValor       : String;
   sLinhasVerso : Array [0..15] of String;
begin
   if dblcModeloCheque.Text='' then
    begin
       MsgDlg('O Modelo do Cheque não pode ser deixado em Branco','Erro',mtError,[mbOk],0);
       dblcModeloCheque.SetFocus;
       modalResult := mrCancel;
       Abort;
    end;

   if (edFavorecido.Text='') then
    begin
       MsgDlg('O Favorecido não pode ser deixado em Branco','Erro',mtError,[mbOk],0);
       edFavorecido.SetFocus;
       modalResult := mrCancel;
       Abort;
    end;

   if not(edNumChq.Value>0) then
    begin
       MsgDlg('O Número do Cheque tem que ser maior que Zero','Erro',mtError,[mbOk],0);
       edNumChq.SetFocus;
       modalResult := mrCancel;
       Abort;
    end;

   if (EdLocalEmissCheque.Text='') then
    begin
       MsgDlg('O Local de Emissão não poede ser deixado em Branco','Erro',mtError,[mbOk],0);
       EdLocalEmissCheque.SetFocus;
       modalResult := mrCancel;
       Abort;
    end;

   if CkbMaquina.Checked then
    begin
       if CmbModelo.Text='' then
        begin
           MsgDlg('O Modelo de Impressora não pode ser deixado em Branco','Erro',mtError,[mbOk],0);
           pgcCheque.ActivePage:=tbsImpressoraCheque;
           CmbModelo.SetFocus;
           modalResult := mrCancel;
           Abort;
        end;

       if (ComboBoxDeviceName.Text='') then
        begin
           MsgDlg('O Modelo de Impressora não pode ser deixado em Branco','Erro',mtError,[mbOk],0);
           pgcCheque.ActivePage:=tbsImpressoraCheque;
           ComboBoxDeviceName.SetFocus;
           modalResult := mrCancel;
           Abort;
        end;
    end;

   if CkbVersoCheque.Checked and (Trim(memVersoCheque.Text)='') then
    begin
       MsgDlg('O Verso do cheque não pode ser deixado em Branco','Erro',mtError,[mbOk],0);
       pgcCheque.ActivePage:=tbsVersoCheque;
       memVersoCheque.SetFocus;
       modalResult := mrCancel;
       Abort;
    end
   else
    if memVersoCheque.Lines.Count>16 then
     begin
        MsgDlg('O número de linhas do verso do cheque excedeu o valor máximo (16 Linhas)',
               'Erro',mtError,[mbOk],0);
        pgcCheque.ActivePage:=tbsVersoCheque;
        memVersoCheque.SetFocus;
        modalResult := mrCancel;
        Abort;
     end
    else
     for iLinha:=0 to memVersoCheque.Lines.Count do
      if Length(Trim(memVersoCheque.Lines[iLinha]))>60 then
       begin
          MsgDlg('O verso do cheque contém alguma(s) linha(s) que excede(m) o '+
                 'limite de 60 caracteres','Erro',mtError,[mbOk],0);
          pgcCheque.ActivePage:=tbsVersoCheque;
          memVersoCheque.SetFocus;
          modalResult := mrCancel;
          Exit;
       end;

   //Testa o Bloqueio de Talão
   if not(TestaCheque(False)) then
    begin
       ModalResult:=mrNone;
       Exit;
       modalResult := mrCancel;
    end;

   //Testa se a Impressão do Cheque será com impressora de cheques
   if CkbMaquina.Checked then
    begin
       //Parâmetros da Impressora de Cheques
       CmCheque.BaudRate   := br9600;
       CmCheque.DataBits   := db8;
       CmCheque.Parity     := paNone;
       CmCheque.StopBits   := sb1;
       CmCheque.DeviceName := ComboBoxDeviceName.Text;

       sValor := Trim(FloatToStrF(rValorAux,ffnumber, 17, 2));
       while Pos('.', sValor) <> 0 do Delete(sValor, Pos('.', sValor), 1);

       if CmCheque.Inicializar then
        begin
           CmCheque.Valor      := sValor;
           CmCheque.Favorecido := edFavorecido.Text;
           CmCheque.Localidade := edLocalEmissCheque.Text;
           CmCheque.Data       := FormatDateTime('dd/mm/yy',DtEmis.Date);
           CmCheque.CodBanco   := Trim(sCodBancoAux);

           dblcModeloChequeChange(sender);

           CmCheque.Imprime;
           if CkbVersoCheque.Checked then
              if Application.MessageBox('Insira o cheque para impressão do verso e confirme','Aguardando Comando...',
                                         Mb_IconInformation + Mb_OkCancel) = Id_Cancel then
                  Abort
              else
               begin
                  iNumLinhas:=memVersoCheque.Lines.Count-1;
                  if iNumLinhas>15 then iNumLinhas:=15;
                  for iLinha:=0 to iNumLinhas do
                      if Trim(memVersoCheque.Lines[iLinha])='' then
                         sLinhasVerso[iLinha]:='.'
                      else
                         sLinhasVerso[iLinha]:=GeralFinanc.Replicate(' ',10)+
                                               Trim(memVersoCheque.Lines[iLinha]);
                  CmCheque.ImprimeVerso(sLinhasVerso);
               end;
           TestaCheque(True);
        end;
    end
   else  //Impressão de Cheques com Impressora convencional
    begin
       ImprimeFrenteCheque;
       if CkbVersoCheque.Checked then ImprimeVersoCheque;
       TestaCheque(True);
    end;
end;



procedure TfrmEmiteChequeMT.ImprimeFrenteCheque;
var
   sValor : String;
   CheqBloqCM : TCheqBloqCM;
begin
   CheqBloqCM := TCheqBloqCM.Create('',-1);
   try

      CheqBloqCM.NumBloqChqSaltoLinha := cdsModeloCheque.FieldByName('NUMCHQSALTO').AsInteger;
      CheqBloqCM.NumLinhasSalto       := cdsModeloCheque.FieldByName('NUMLINHASSALTO').AsInteger;

      if CheqBloqCM.InicializaImpressora('Emissão de Cheques') then
      begin
         CheqBloqCM.FonteCondensada := (cdsModeloCheque.FieldByName('FLGIMPCONDENSADO').AsString = 'S');

         sValor := FormatFloat('#,##0.00',rValorAux);
         Extenso.Valor:= rValorAux;

         if Sistema.IdiomaAtivo = 2 Then
          begin
             Extenso.DescricaoMoeda.Singular := '';
             Extenso.DescricaoMoeda.Plural   := '';
          end
         else
            Extenso.SetaMoedaPadrao;

         Extenso.SetaIdiomaPadrao;
         Extenso.Escreve;

         CheqBloqCM.IdTemplCheque := cdsModeloCheque.FieldByName('IDTEMPLCHEQUE').AsInteger;
         CheqBloqCM.CompAno       := cdsModeloCheque.FieldByName('QTDEDIGITOSANO').AsInteger;
         CheqBloqCM.Valor         := CheqBloqCM.CompletaValorCheque(sValor,15);
         CheqBloqCM.Extenso       := Extenso.Extenso;
         CheqBloqCM.Portador      := edFavorecido.Text;
         CheqBloqCM.Local         := edLocalEmissCheque.Text;
         CheqBloqCM.Data          := DtEmis.Date;

         if DtDiferido.Text<>'' then
          begin
             CheqBloqCM.LocalDiferido := edLocalDiferido.Text;
             CheqBloqCM.DataDiferido  := DtDiferido.Date;
          end
         else
             CheqBloqCM.LocalDiferido := '';

         if not(CheqBloqCM.GeraCheque) Then abort;
         CheqBloqCM.Imprime;
      end;
   finally
      CheqBloqCM.Free;
   end;
end;



function TfrmEmiteChequeMT.ImprimeVersoCheque: Boolean;
var
  iLinha : Integer;
begin
   Result := False;
   try
      if Application.MessageBox('Vire o formulário para impressão de verso de '+
                                'cheque','Aguardando Comando...',
                                Mb_IconInformation + Mb_OkCancel) = Id_Cancel Then
         Abort
      else
       begin
          if GImpCheque.Inicializar then
           try
               GImpCheque.Condensado:=(cdsModeloCheque.FieldByName('FLGIMPCONDENSADO').AsString = 'S');
               for iLinha:=0 to 15 do
                   GImpCheque.ImprimirTexto(memVersoCheque.Lines[iLinha]);
               GImpCheque.Finalizar;
           except
               GImpCheque.Finalizar;
               raise;
           end;
       end;
   except
      Result := False
   end;
end;



function TfrmEmiteChequeMT.TestaCheque(Gravar: Boolean): Boolean;
begin
   Result:=True;

   sqlpTesteCheque.Prepare;
   sqlpTesteCheque.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   sqlpTesteCheque.Open;

   if Trim(cdsTesteCheque.FieldByName('FLGCONTROLACHEQUE').AsString)='S' then
    begin
       with TCtrlCheque.Create do
          try
             ValidaPrimeiroCheque:=True;
             MostraMsg    := True;
             VerificaChq  := True;
             CodPortador  := Trunc(rCodPortadorAux);
             NumCheque    := edNumChq.Value;
             GravaNumChq  := Gravar;
             Result:=(ValidaNumCheque=vcOk);
          finally
             Free;
          end;
    end;
   cdsTesteCheque.Close;
end;



procedure TfrmEmiteChequeMT.ComboBoxDeviceNameChange(Sender: TObject);
begin
  inherited;
  CmCheque.DeviceName := ComboBoxDeviceName.Text;
end;



end.
