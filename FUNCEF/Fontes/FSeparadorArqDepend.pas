unit FSeparadorArqDepend;
{  *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  20/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//-----------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls,uSistema;

type
//------------------------------------------------------------------------------
// Tipos Declarados para Manipular as Linhas do Arquivo Saída

     TSaida = Record
                      NR_MATR_EMP   : String[6];
                      SQ_DEP        : String[2];
                      NO_DEP        : string[40];
                      DT_NASC_DEP   : String[10];
                      CD_SEXO       : String[1];
                      CD_EST_CIV    : String[1];
                      CD_REL_DEPND  : String[1];
                      ID_IR         : String[1];
                      ID_INVALIDEZ  : String[1];
                      ID_SF_CEF     : String[1];
                      ID_SF_INSS    : String[1];
                      DT_IN_DEP     : String[10];
                      ID_RECB_PECULIO : String [1];
                      CD_TIP_DEP_PAMS : String[1];
                      DT_FM_CATR_PAMS : String[10];                       
                End;

//------------------------------------------------------------------------------

  TfrmSeparadorArqDepend = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    lblBarraProgresso: TLabel;
    lblArqGravar: TLabel;
    Bevel2: TBevel;
    lblPathArqProc: TLabel;
    btnArqProcessar: TSpeedButton;
    spedArqGravar: TSpeedButton;
    Animate1: TAnimate;
    edArqGravar: TEdit;
    edtArqProc: TEdit;
    OpenDialog1: TOpenDialog;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spedArqGravarClick(Sender: TObject);
    procedure btnArqProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  Function VerificaArquivo(Arquivo : String):Boolean;
  Function PreencheEspaco (Campo : String; Tam : Integer ) : String;

  Procedure ConversaoUNLD65;
  Procedure GravaDepend;
  public
    { Public declarations }
  end;

var
  frmSeparadorArqDepend: TfrmSeparadorArqDepend;

  LRegUNLD65       : TSaida;

implementation

Uses uDataBAse, UMensErro,  DBaseDados;

Var
 wArquivoImportacao, wArquivoGravacao :TextFile;
 wLinha:String;

{$R *.DFM}

Function TfrmSeparadorArqDepend.PreencheEspaco (Campo : String; Tam : Integer ) : String;
Var
  I   : Integer;
  Aux : String;
begin
  For I := 1 to Tam - Length(Campo) do
   Aux := Aux + ' ';
  Result := Aux + Campo;
end;

Function TfrmSeparadorArqDepend.VerificaArquivo(Arquivo : String):Boolean;
begin
  Result := True;
   // Testa se Arquivo Especificado Existe
  If Not (FileExists(edtArqProc.Text)) Then Begin
    ShowMessage('Arquivo não Existe ou Inválido ...');
    edtArqProc.SetFocus;
    Result := False;
  End;
end;   

procedure TfrmSeparadorArqDepend.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not VerificaArquivo(edtArqProc.text) then exit;

  ConversaoUNLD65;
end;  

Procedure TfrmSeparadorArqDepend.GravaDepend;
begin

  { Gravar Novo Registro Dependentes}

  wLinha :=     LRegUNLD65.NR_MATR_EMP+
                LRegUNLD65.SQ_DEP+
                LRegUNLD65.NO_DEP;

                If LRegUNLD65.DT_NASC_DEP = '01.01.0001' Then
                   wLinha := wLinha + '          '
                Else
                   wLinha := wLinha + LRegUNLD65.DT_NASC_DEP;

                wLinha := wLinha + LRegUNLD65.CD_SEXO;

               Case StrToInt(LRegUNLD65.CD_EST_CIV)  of

                    1 : wLinha := wLinha + 'S';
                    2 : wLinha := wLinha + 'C';
                    3 : wLinha := wLinha + 'V';
                    4 : wLinha := wLinha + 'E';
                    5 : wLinha := wLinha + 'D';
                    6 : wLinha := wLinha + 'J';
               end;

               If LRegUNLD65.CD_REL_DEPND = 'B' Then
                  wLinha := wLinha + 'OUT'
               Else
                 If LRegUNLD65.CD_REL_DEPND = 'C' Then
                    wLinha := wLinha + 'COM'
                 Else
                    If LRegUNLD65.CD_REL_DEPND = 'E' Then
                       wLinha := wLinha + 'EXC'
                    Else
                       If LRegUNLD65.CD_REL_DEPND = 'F' Then
                          wLinha := wLinha + 'FIL'
                       Else
                         If LRegUNLD65.CD_REL_DEPND = 'I' Then
                            wLinha := wLinha + 'IRM'
                         Else
                            If LRegUNLD65.CD_REL_DEPND = 'O' Then
                               wLinha := wLinha + 'OUT'
                            Else
                               If LRegUNLD65.CD_REL_DEPND = 'P' Then
                                  wLinha := wLinha + 'PAI'
                               Else
                                  If LRegUNLD65.CD_REL_DEPND = 'T' Then
                                     wLinha := wLinha + 'OUT' ;


               If LRegUNLD65.ID_IR = 'S' Then
                  wLinha := wLinha + '1'
               Else
                  wLinha := wLinha + '0' ;

               If LRegUNLD65.ID_INVALIDEZ = 'S' Then
                  wLinha := wLinha + '1'
               Else
                  wLinha := wLinha + '0' ;

               If LRegUNLD65.ID_SF_CEF = 'S' Then
                  wLinha := wLinha + '1'
               Else
                  wLinha := wLinha + '0' ;

               If LRegUNLD65.ID_SF_INSS = 'S' Then
                  wLinha := wLinha + '1'
               Else
                  wLinha := wLinha + '0' ;

               If LRegUNLD65.DT_IN_DEP = '01.01.0001' Then
                  wLinha := wLinha + '          '
               Else
                  wLinha := wLinha + LRegUNLD65.DT_IN_DEP;

   WriteLn(wArquivoGravacao,wLinha);
end;

Procedure TfrmSeparadorArqDepend.ConversaoUNLD65;
Var
  Aux : string;
  Ini : TTime;
  Contador : Integer;
begin
   Try
  // Seta Arquivo, a Variavel ...
    AssignFile(wArquivoImportacao, edtArqProc.Text);
  // Abre Arquivo para Leitura
    Reset(wArquivoImportacao);
  Except
    ShowMessage('Erro ao abrir Arquivo...');
    Exit;
  End;

  Try
  // Seta Arquivo, a Variavel ...
   AssignFile(wArquivoGravacao, edArqGravar.Text);
  // Abre Arquivo para Gravação
   Rewrite(wArquivoGravacao);
  Except
    ShowMessage('Erro ao abrir Arquivo...');
    Exit;
  End;

   // Liga Animate
  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

  { Leitura dos Dados Fora do While }
  Readln(wArquivoImportacao,wLinha);

// Inicia Processamento
   While trim(wLinha) <> ''  do begin

   { Processa Registros }

    LRegUNLD65.NR_MATR_EMP   := Copy(wLinha,1,6);
    LRegUNLD65.SQ_DEP        := Copy(wLinha,7,2);
    LRegUNLD65.NO_DEP        := Copy(wLinha,9,40);
    LRegUNLD65.DT_NASC_DEP   := Copy(wLinha,49,10);
    LRegUNLD65.CD_SEXO       := Copy(wLinha,59,1);
    LRegUNLD65.CD_EST_CIV    := Copy(wLinha,60,1);
    LRegUNLD65.CD_REL_DEPND  := Copy(wLinha,61,1);
    LRegUNLD65.ID_IR         := Copy(wLinha,62,1);
    LRegUNLD65.ID_INVALIDEZ  := Copy(wLinha,63,1);
    LRegUNLD65.ID_SF_INSS    := Copy(wLinha,65,1);
    LRegUNLD65.DT_IN_DEP     := Copy(wLinha,66,10);

   { Gravar Novo Registro }

   GravaDepend;  

   { Leitura dos Dados }
   Readln(wArquivoImportacao,wLinha);

   Inc(Contador);
  End;

  { Fecha Arquivos}
  closeFile(wArquivoGravacao);
  closeFile(wArquivoImportacao);

  // Desliga Animate
  lblBarraProgresso.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  // Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg('Inicio.:   '+TimeToStr(Ini) +#13+
         'Final .:   '+TimeToStr(Time)+#13+
         '             ---------------'+#13+
         'Tempo .: '+TimeToStr(Time-Ini)+
         '  (Numero de Registros.: '+IntToStr(Contador)+')',

         'Importação OK',MtInformation,[MbOk],0);   
end;

procedure TfrmSeparadorArqDepend.spedArqGravarClick(Sender: TObject);
begin
  inherited;
    // Abre a Gravação e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edArqGravar.Text := UpperCase(OpenDialog1.FileName);
  End Else Begin
//    ShowMessage('Arquivo Inválido ');
  End;
end;

procedure TfrmSeparadorArqDepend.btnArqProcessarClick(Sender: TObject);
begin
  inherited;
   // Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArqProc.Text := UpperCase(OpenDialog1.FileName);
  End Else Begin
//    ShowMessage('Arquivo Inválido ');
  End;
end;

procedure TfrmSeparadorArqDepend.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  OpenDialog1.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

end;

end.


00000151MARIA ANDRE DE LIMA                     06.10.1925F1OSNNN29.06.1995N001.01.0001
