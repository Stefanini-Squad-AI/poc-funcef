unit FLogCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, ExtCtrls, MAHlpBtn, Buttons, Db,
  DBTables, Wwquery,   TB97,  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmLogCCusto = class(TfrmOkCancelar)
    qryCCusto: TwwQuery;
    qryAlmoxa: TwwQuery;
    grpLogAlmoxa: TGroupBox;
    Label1: TLabel;
    lbAlmoxarifado: TLabel;
    Image1: TImage;
    dblcCCusto: TwwDBLookupCombo;
    dlblcAlmox: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    bPodeLogar  : Boolean;
  end;
var
  frmLogCCusto: TfrmLogCCusto;

implementation

uses USistema, UMensErro, uModulo ;

{$R *.DFM}

procedure TfrmLogCCusto.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Modulo.iCodAlmoxa     := -1;
   Modulo.iCodCusteio    := -1;
   Modulo.sAlmoxaUsuario := '';
   Modulo.sPrincSec      := '';
   Modulo.sCCustoAlmoxa  := '';
   Modulo.sCodCCusto     := '';
   Modulo.sDescCCusto    := '';
   If Not Sistema.SuperUsuario then
      Begin
         If Trim(dblcCCusto.Text) = '' Then
            Begin
                MsgDlg('Centro de Custo não preenchido.', 'Erro', mtError, [mbOk], 0);
            End
         Else
         If Trim(dlblcAlmox.Text) = '' then
            Begin
                MsgDlg('Almoxarifado não preenchido.', 'Erro', mtError, [mbOk], 0);
            End
         Else
            Begin
                 Modulo.sCodCCusto  := qryCCusto.FieldByName('CODCENTROCUSTO').AsString;
                 Modulo.sDescCCusto := qryCCusto.FieldByName('NOME').AsString;
                 If Not qryAlmoxa.IsEmpty then
                    Begin
                        Modulo.iCodAlmoxa     := qryAlmoxa.FieldByName('CODALMOXARIFADO').AsInteger;
                        Modulo.iCodCusteio    := qryAlmoxa.FieldByName('CODCUSTEIO').AsInteger;
                        Modulo.sAlmoxaUsuario := dlblcAlmox.Text;
                        Modulo.sPrincSec      := qryAlmoxa.FieldByName('PRINCIPSECUND').AsString;
                        Modulo.sCCustoAlmoxa  := qryAlmoxa.FieldByName('CODCENTROCUSTO').AsString;
                    End;
                 ModalResult := mrOk;
            End;
      End
   Else
      Begin
         ModalResult := mrOk;
         bPodeLogar := True;
      End;
end;

procedure TfrmLogCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   if ModalResult = idabort Then
     Begin
        If Trim(Modulo.sCodCCusto) = '' Then
           Begin
              bPodeLogar := False;
              Modulo.sCodCCusto     := '';
              Modulo.sDescCCusto    := '';
              Modulo.iCodAlmoxa     := -1;
              Modulo.iCodCusteio    := -1;
              Modulo.sAlmoxaUsuario := '';
              Modulo.sPrincSec      := '';
              Modulo.sCCustoAlmoxa  :='';
            End
         Else
            bPodeLogar := True;
     End;
end;

procedure TfrmLogCCusto.bbtnSairClick(Sender: TObject);
begin
     ModalResult := idAbort;
end;

procedure TfrmLogCCusto.FormCreate(Sender: TObject);
Var
   sSQL : String;
begin
  inherited;
   bPodeLogar := True;
   qryCCusto.Close;
   qryCCusto.Sql.Clear;
   If Sistema.SuperUsuario Then
      sSQL := 'SELECT CODCENTROCUSTO,NOME FROM CENTCUST '+
              ' WHERE '+
              '     (STATUSGRUPOCDC = ''A'') '+
              ' AND (ATIVO =''S'')'+
              ' AND (IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa)+')'+
              ' ORDER BY NOME'
   else
      sSQL := ' SELECT CC.CODCENTROCUSTO, '+
                '        CC.NOME '+
                ' FROM   CENTCUST CC, '+
                '        USCCUSTO UC '+
                ' WHERE (STATUSGRUPOCDC =''A'')'+
                ' AND   (ATIVO = ''S'') '+
                ' AND   (CC.IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)+')'+
                ' AND   (UC.IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+')'+
                ' AND   (CC.CODCENTROCUSTO = UC.CODCENTROCUSTO) '+
                ' AND   (CC.IDEMPRESA      = UC.IDEMPRESA ) '+
                ' ORDER BY CC.NOME';
   qryCCusto.Sql.Add(sSQL);
   qryCCusto.Open;
   //
   qryAlmoxa.Close;
   qryAlmoxa.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qryAlmoxa.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
   qryAlmoxa.Open;
   //se o usuário não estiver cadastrado em nenhum ccusto, cancela a entrada no Modulo.
    If qryCCusto.isEmpty then
       Begin
         If Not Sistema.SuperUsuario Then
            MsgDlg('Você não está cadastrado em nenhum Centro de Custo, peça para o administrador '+
       	         'do Sistema cadastrá-lo antes. ', 'Aviso', mtInformation, [mbOk], 0)
         Else
            Begin
               bPodeLogar  := True;
               bbtnSair.Click;
            End;
       End;
end;

end.
