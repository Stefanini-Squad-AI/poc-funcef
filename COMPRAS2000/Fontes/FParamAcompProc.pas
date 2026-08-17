unit FParamAcompProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamAcompProc = class(TfrmOkCancelar)
    qryProc: TwwQuery;
    qryProcCODPROCESSO: TFloatField;
    Label2: TLabel;
    dblcProc: TwwDBLookupCombo;
    qryComp: TwwQuery;
    qryCompNOMEUSUARIO: TStringField;
    qryCompIDCOMPRADOR: TFloatField;
    dblcComprador: TCMDBLookupCombo;
    Label1: TLabel;
    RgOrdem: TRadioGroup;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edDataI: TCMDateTimePicker;
    edDataF: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamAcompProc: TFrmParamAcompProc;

implementation

{$R *.DFM}

Uses DRelCompras, uMensErro;

procedure TFrmParamAcompProc.FazRel;
begin
  DtmRelCompras.LbPer.Caption := ' De ' +edDataI.Text+' a '+edDataF.Text;
  With DtmRelCompras.qryAcompProc Do
  Begin
     Close;
     Sql.Clear;
     Sql.Add('SELECT   ');
     Sql.Add('      P.CODPROCESSO,           ');
     Sql.Add('      P.STATUS,                ');
     Sql.Add('      P.TRGDTINCLUSAO AS DATA, ');
     Sql.Add('      DECODE(P.STATUS,''P'',''Pendente de Cotação'',           ');
     Sql.Add('                      ''C'',''Em Cotação'',                    ');
     Sql.Add('                      ''S'',''Sumário já Calculado'',          ');
     Sql.Add('                      ''O'',''Pronta para Gerar O.C.'',        ');
     Sql.Add('                      ''F'',''O.C. já Gerada'') AS DESCSTATUS, ');
     Sql.Add('      U.NOMEUSUARIO AS COMPRADOR    ');
     Sql.Add('FROM                                ');
     Sql.Add('     PROCESSO P,                    ');
     Sql.Add('     USUARIOSISTEMA U               ');
     Sql.Add('WHERE (1=1)                         ');
     If Trim(dblcProc.Text) <> '' Then
        Sql.Add(' AND  (P.CODPROCESSO = '+dblcProc.LookupValue+') ')
     Else
        Begin
           If Trim(dblcComprador.Text) <> '' Then
              Sql.Add(' AND  (P.IDCOMPRADOR = '+dblcComprador.LookupValue+') ');
           Sql.Add('   AND (P.TRGDTINCLUSAO >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY''))');
           Sql.Add('   AND (P.TRGDTINCLUSAO <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY''))');
        End;
     Sql.Add('   AND (P.IDCOMPRADOR = U.IDUSUARIO) ');

     Case RgOrdem.ItemIndex Of
        0: Sql.Add('ORDER BY P.CODPROCESSO');
        1: Sql.Add('ORDER BY P.STATUS');
        2: Sql.Add('ORDER BY COMPRADOR');
        3: Sql.Add('ORDER BY P.TRGDTINCLUSAO');                
     End;
  End;

end;

procedure TFrmParamAcompProc.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Open;
  qryComp.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

procedure TFrmParamAcompProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
    If trim(edDataI.Text) = '' Then
    Begin
       MsgDlg('Data de início não preenchido','Erro',mtError,[mbOk],0);
       edDataI.SetFocus;
       ModalResult := mrNone;
    End;
    If trim(edDataF.Text) = '' Then
    Begin
       MsgDlg('Data de término não preenchido','Erro',mtError,[mbOk],0);
       edDataF.SetFocus;
       ModalResult := mrNone;
    End
    Else
    Begin
       ModalResult := mrOk;
       FazRel;
    End;

end;

end.
