unit FEmiteCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, uExtensoCM, ComPort,
  uImprimeCheque, Db, DBTables, Wwquery, wwdblook, ComCtrls, uGImp,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEmiteCheque = class(TfrmOkCancelar)
    Label2: TLabel;
    edNumChq: TRealEdit;
    Label5: TLabel;
    edLocalEmissCheque: TEdit;
    CmCheque: TCmImprimeCheque;
    Extenso: TExtensoCM;
    qryModelosCheque: TwwQuery;
    qryModelosChequeIDTEMPLCHEQUE: TFloatField;
    qryModelosChequeLAYOUT: TStringField;
    dblcModeloCheque: TwwDBLookupCombo;
    Label1: TLabel;
    pgcCheque: TPageControl;
    tbsImpressoraCheque: TTabSheet;
    tbsVersoCheque: TTabSheet;
    GpMaqCheque: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    CmbModelo: TComboBox;
    ComboBoxDeviceName: TComboBox;
    CkbMaquina: TCheckBox;
    CkbVersoCheque: TCheckBox;
    memVersoCheque: TMemo;
    DtEmis: TCMDateTimePicker;
    Label4: TLabel;
    edFavorecido: TEdit;
    labelfavorecido: TLabel;
    GImpCheque: TGImp;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DtDiferido: TCMDateTimePicker;
    edLocalDiferido: TEdit;
    qryModelosChequeQTDEDIGITOSANO: TStringField;
    qryModelosChequeFLGIMPCONDENSADO: TStringField;
    qryModelosChequeNUMCHQSALTO: TFloatField;
    qryModelosChequeNUMLINHASSALTO: TFloatField;
    qryTestaControleCheque: TwwQuery;
    qryTestaControleChequeFLGCONTROLACHEQUE: TStringField;
    lblLinha: TLabel;
    procedure CmbModeloChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CkbMaquinaClick(Sender: TObject);
    procedure CkbVersoChequeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FValor          : Currency;
    FCodigoPortador : Integer;
    FAutoDestroi    : Boolean;
    FCodigoBanco    : String;
    function TestaDados: Boolean;
    procedure ImprimeFrenteCheque;
    function ImprimeVersoCheque:Boolean;
    function TestaCheque(Gravar: Boolean): Boolean;
  public
    { Public declarations }
    property Valor: Currency         read FValor          write FValor;
    property CodigoPortador: Integer read FCodigoPortador write FCodigoPortador;
    property AutoDestroi: Boolean    read FAutoDestroi    write FAutoDestroi;
    property CodigoBanco: String     read FCodigoBanco    write FCodigoBanco;
  end;

var
  frmEmiteCheque: TfrmEmiteCheque;

implementation

{$R *.DFM}

uses UString,UCheqBloq,USistema,uCtrlCheque;

procedure TfrmEmiteCheque.FormCreate(Sender: TObject);
begin
   inherited;
   CmbModelo.Items.Text := CmCheque.ModelosImpressoras;
   CmbModelo.ItemIndex := 0;
   FValor:=0;
   FAutoDestroi:=True;
   qryModelosCheque.Open;
   DtEmis.Date:=Now;
end;

procedure TfrmEmiteCheque.FormDestroy(Sender: TObject);
begin
   qryModelosCheque.Close;
   inherited;
end;

procedure TfrmEmiteCheque.FormShow(Sender: TObject);
begin
   inherited;
   pgcCheque.ActivePage:=tbsImpressoraCheque;
end;

procedure TfrmEmiteCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if AutoDestroi then inherited;
end;

procedure TfrmEmiteCheque.CmbModeloChange(Sender: TObject);
begin
   case CmbModelo.ItemIndex of
      0:CmCheque.NomeImpressora := niChronos_ACC100;
      1:CmCheque.NomeImpressora := niChronos_ACC300;
   end;
end;

procedure TfrmEmiteCheque.CkbMaquinaClick(Sender: TObject);
begin
  GpMaqCheque.Enabled:=CkbMaquina.Checked;
  if GpMaqCheque.Enabled then CmbModelo.SetFocus;
end;

procedure TfrmEmiteCheque.CkbVersoChequeClick(Sender: TObject);
begin
   memVersoCheque.Enabled:=CkbVersoCheque.Checked;
   if memVersoCheque.Enabled then memVersoCheque.SetFocus;
end;

procedure TfrmEmiteCheque.bbtnConfirmarClick(Sender: TObject);
var
   iLinha       : Integer;
   iNumLinhas   : Integer; 
   sValor       : String;
   sLinhasVerso : Array [0..15] of String;
begin
   if TestaDados then
    begin

       //Testa o Bloqueio de Talão
       if not(TestaCheque(False)) then
        begin
           ModalResult:=mrNone;
           Exit;
        end;

       //Testa se a Impressão do Cheque será com impressora de cheques
       if CkbMaquina.Checked then
        begin
           //Parâmetros da Impressora de Cheques
           CmCheque.BaudRate   := br9600;
           CmCheque.DataBits   := db8;
           CmCheque.DeviceName := 'COM1';
           CmCheque.Parity     := paNone;
           CmCheque.StopBits   := sb1;
           CmCheque.DeviceName := ComboBoxDeviceName.Text;

           sValor := Trim(FloatToStrF(FValor,ffnumber, 17, 2));
           while Pos('.', sValor) <> 0 do
                 Delete(sValor, Pos('.', sValor), 1);

           if CmCheque.Inicializar Then
            begin
               CmCheque.Valor      := sValor;
               CmCheque.Favorecido := edFavorecido.Text;
               CmCheque.Localidade := edLocalEmissCheque.Text;
               CmCheque.Data       := FormatDateTime('dd/mm/yy',DtEmis.Date);
               CmCheque.CodBanco   := Trim(FCodigoBanco);

               CmCheque.Imprime;
               if CkbVersoCheque.Checked Then
                  if Application.MessageBox('Insira o cheque para impressão do verso e confirme','Aguardando Comando...',
                                            Mb_IconInformation + Mb_OkCancel) = Id_Cancel Then
                     Abort
                  else
                   begin
                      iNumLinhas:=memVersoCheque.Lines.Count-1;
                      if iNumLinhas>15 then iNumLinhas:=15;
                      for iLinha:=0 to iNumLinhas do
                          if Trim(memVersoCheque.Lines[iLinha])='' then
                             sLinhasVerso[iLinha]:='.'
                          else
                             sLinhasVerso[iLinha]:=Espaco(' ',10)+Trim(memVersoCheque.Lines[iLinha]);
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
    end
   else
    ModalResult:=mrNone;
end;

function TfrmEmiteCheque.TestaDados: Boolean;
var
   Componente : TWinControl;
   Mensagem   : String;
   iLinha     : Integer;
begin
   Result:=True;
   Componente:=nil;

   if dblcModeloCheque.Text='' then
    begin
       Mensagem:='O Modelo do Cheque não pode ser deixado em Branco';
       Componente:=dblcModeloCheque;
       Result:=False;
    end;

   if Result and (edFavorecido.Text='') then
    begin
       Mensagem:='O Favorecido não pode ser deixado em Branco';
       Componente:=edFavorecido;
       Result:=False;
    end;

   if Result and not(edNumChq.Value>0) then
    begin
       Mensagem:='O Número do Cheque tem que ser maior que Zero';
       Componente:=edNumChq;
       Result:=False;
    end;

   if Result and (EdLocalEmissCheque.Text='') then
    begin
       Mensagem:='O Local de Emissão não poede ser deixado em Branco';
       Componente:=EdLocalEmissCheque;
       Result:=False;
    end;

   if Result and CkbMaquina.Checked then
    begin
       if CmbModelo.Text='' then
        begin
           Mensagem:='O Modelo de Impressora não pode ser deixado em Branco';
           pgcCheque.ActivePage:=tbsImpressoraCheque;
           Componente:=CmbModelo;
           Result:=False;
        end;

       if Result and (ComboBoxDeviceName.Text='') then
        begin
           Mensagem:='O Modelo de Impressora não pode ser deixado em Branco';
           pgcCheque.ActivePage:=tbsImpressoraCheque;
           Componente:=ComboBoxDeviceName;
           Result:=False;
        end;
    end;

   if Result and CkbVersoCheque.Checked and (Trim(memVersoCheque.Text)='') then
    begin
       Mensagem:='O Verso do cheque não pode ser deixado em Branco';
       pgcCheque.ActivePage:=tbsVersoCheque;
       Componente:=memVersoCheque;
       Result:=False;
    end
   else
    if memVersoCheque.Lines.Count>16 then
     begin
        Mensagem:='O número de linhas do verso do cheque excedeu o valor máximo (16 Linhas)';
        pgcCheque.ActivePage:=tbsVersoCheque;
        Componente:=memVersoCheque;
        Result:=False;
     end
    else
     for iLinha:=0 to memVersoCheque.Lines.Count do
      if Length(Trim(memVersoCheque.Lines[iLinha]))>60 then
       begin
          Mensagem:='O verso do cheque contém alguma(s) linha(s) que excede(m) o limite de 60 caracteres';
          pgcCheque.ActivePage:=tbsVersoCheque;
          Componente:=memVersoCheque;
          Result:=False;
          Break;
       end;

   if not(Result) then
    begin
       MessageBox(Handle,Pchar(Mensagem),'Erro',MB_OK+MB_ICONQUESTION+MB_SYSTEMMODAL);
       Componente.SetFocus;
    end;
end;

procedure TfrmEmiteCheque.ImprimeFrenteCheque;
var
   sValor : String;
   CheqBloqCM : TCheqBloqCM;
begin
   CheqBloqCM := TCheqBloqCM.Create('',-1);
   try

      CheqBloqCM.NumBloqChqSaltoLinha  := qryModelosCheque.FieldByName('NUMCHQSALTO').AsInteger;
      CheqBloqCM.NumLinhasSalto        := qryModelosCheque.FieldByName('NUMLINHASSALTO').AsInteger;

      if CheqBloqCM.InicializaImpressora('Emissão de Cheques') then
      begin
         CheqBloqCM.FonteCondensada := (qryModelosCheque.FieldByName('FLGIMPCONDENSADO').AsString = 'S');

         sValor := FormatFloat('#,##0.00',FValor);
         Extenso.Valor:= FValor;

         if Sistema.IdiomaAtivo = 2 Then
          begin
             Extenso.DescricaoMoeda.Singular := '';
             Extenso.DescricaoMoeda.Plural   := '';
          end
         else
            Extenso.SetaMoedaPadrao;

         Extenso.SetaIdiomaPadrao;
         Extenso.Escreve;

         CheqBloqCM.IdTemplCheque := qryModelosCheque.FieldByName('IDTEMPLCHEQUE').AsInteger;
         CheqBloqCM.CompAno       := qryModelosCheque.FieldByName('QTDEDIGITOSANO').AsInteger;
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

function TfrmEmiteCheque.ImprimeVersoCheque:boolean;
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
               GImpCheque.Condensado:=(qryModelosCheque.FieldByName('FLGIMPCONDENSADO').AsString = 'S');
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

function TfrmEmiteCheque.TestaCheque(Gravar: Boolean): Boolean;
begin
   Result:=True;

   qryTestaControleCheque.Close;
   qryTestaControleCheque.ParamByName('IDPessoa').ASFloat:=Sistema.IdEmpresa;
   qryTestaControleCheque.Open;

   if Trim(qryTestaControleChequeFLGCONTROLACHEQUE.AsString)='S' then
    begin
       with TCtrlCheque.Create do
          try
             ValidaPrimeiroCheque := True;
             MostraMsg    := True;
             VerificaChq  := True;
             CodPortador  := FCodigoPortador;
             NumCheque    := edNumChq.Value;
             GravaNumChq  := Gravar;
             Result:=ValidaNumCheque;
          finally
             Free;
          end;
    end;
   qryTestaControleCheque.Close;    
end;

end.

