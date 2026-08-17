unit fMensagemCPMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, 
  Db, DBTables, Wwquery, FConciliaCPMF, EditReg, 
  TB97Ctls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmMensagemCPMF = class(TfrmSairAjuda)
    sbtnEnviar: TToolbarButton97;
    Panel1: TPanel;
    Panel2: TPanel;
    MenMesagem: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtAssunto: TEdit;
    DtEnvio: TCMDateTimePicker;
    Label4: TLabel;
    EdtRemetente: TEditReg;
    EdtDestino: TEditReg;
    procedure sbtnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  frmMensagemCPMF: TfrmMensagemCPMF;

implementation

Uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMensagemCPMF.sbtnEnviarClick(Sender: TObject);
Var
  sDestino :String;
begin
  inherited;
  If EdtRemetente.Text = '' Then
  Begin
     MsgDlg('O email do Remetente não foi indicado','Erro',mtError,[mbOk],0);
     EdtRemetente.SetFocus;
  End
  Else
  If EdtDestino.Text = '' Then
  Begin
     MsgDlg('O email do Destinatario não foi indicado','Erro',mtError,[mbOk],0);
     EdtDestino.SetFocus;
  End
  Else
  Begin
    If EdtAssunto.Text = '' Then
    Begin
       MsgDlg('O Assunto não foi informado','Erro',mtError,[mbOk],0);
       EdtAssunto.SetFocus;
    End
    Else
    Begin
      If MenMesagem.Lines.Count = 0 Then
      Begin
        MsgDlg('A Mensagem não não foi informada','Erro',mtError,[mbOk],0);
        EdtAssunto.SetFocus;
      End
      Else
      Begin

         sDestino := EdtDestino.Text;

         Repeat
            If Pos(';',sDestino) > 0 Then
            Begin
               //SendMail(EdtAssunto.Text + ' - ' + DtEnvio.Text, EdtRemetente.Text, Copy(sDestino,1,Pos(';',sDestino) - 1), MenMesagem.Lines.Text);
               sDestino := Copy(sDestino,Pos(';',sDestino) + 1, Length(sDestino));
            End
            Else
            Begin
               //SendMail(EdtAssunto.Text + ' - ' + DtEnvio.Text, EdtRemetente.Text, sDestino, MenMesagem.Lines.Text);
               sDestino := '';
            End;

         until sDestino = '';

         ModalResult := MrOk;
         Close;
      End;
    End;
  End;
end;

procedure TfrmMensagemCPMF.FormCreate(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  DtEnvio.Date := Date;

  MenMesagem.Lines.Clear;

  With FrmConciliaCPMF.QryAuditoria Do
  Begin
    Try
       DisableControls;
       First;

       While Not Eof Do
       Begin
         For X:=0 To FieldCount - 1 Do
             MenMesagem.Lines.Add(Fields[x].DisplayLabel + ': ' + Fields[x].AsString);

         MenMesagem.Lines.Add('');
         Next;
       End;
    finally
       EnableControls;
    End;
  End;

  If MenMesagem.Lines.Count > 0 Then
  Begin
     MenMesagem.Lines.Insert(0,'Solicito o cadastramento dos Relacionamentos "Tipo de Desenbolso X Centro de Custo X Programa X CPMF" listados abaixo:');
     MenMesagem.Lines.Insert(1,'');
     MenMesagem.Lines.Add('Grato.');
     MenMesagem.Lines.Add(Sistema.NomeUsuario);
  End;
end;

end.
