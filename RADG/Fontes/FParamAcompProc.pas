unit FParamAcompProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo;

type
  TFrmParamAcompProc = class(TfrmOkCancelar)
    Label1: TLabel;
    dblcProc: TCMDBLookupCombo;
    edNumProc: TEdit;
    Label2: TLabel;
    RgProc: TRadioGroup;
    procedure edNumProcKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamAcompProc: TFrmParamAcompProc;

implementation

{$R *.DFM}

Uses DRelRAD, uMensErro, uSistema;

procedure TFrmParamAcompProc.edNumProcKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Case key of
    '0'..'9',#8:;
  Else
    Key := #0;
  End;
end;

Procedure TFrmParamAcompProc.FazQry;
Begin
   With DtmRelRAD.qryAcompProc Do
     Begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT                                           ');
        Sql.Add('      IP.IDPROCESSO,                              ');
        Sql.Add('      TP.NOME AS NOMEPROC,                        ');
        Sql.Add('      IP.DATAINIPROCESSO,                         ');
        Sql.Add('      IP.DATAFIMPREV,                             ');
        Sql.Add('      IP.DATAFIMPROCESSO,                         ');
        Sql.Add('      IP.OBS AS OBSPROC,                          ');
        Sql.Add('      IE.IDETAPA,                                 ');
        Sql.Add('      IE.DATAFIMETAPA,                            ');
        Sql.Add('      IE.DATAINIETAPA,                            ');
        Sql.Add('      IE.DATAFIMPREV,                             ');
        Sql.Add('      TE.NOME AS NOMETAPA,                        ');
        Sql.Add('      AUT.DATAAUTORIZACAO,                        ');
        Sql.Add('      AUT.OBSAUTORIZA,                            ');
        Sql.Add('      USU.NOMEUSUARIO,                            ');
        Sql.Add('      DECODE(AUT.FLGSTATUS,''R'',''RECUSADO'', DECODE(AUT.FLGSTATUS,''S'',''AUTORIZADO'',''EXECUTADO'')) AS STATUS, ');
        Sql.Add('      P.RAZAOSOCIAL                                ');
        Sql.Add(' FROM                                              ');
        Sql.Add('       PESSOA          P,                          ');
        Sql.Add('       RADINSTETAPA    IE,                         ');
        Sql.Add('       RADINSTPROCESSO IP,                         ');
        Sql.Add('       RADAUTORIZACAO  AUT,                        ');
        Sql.Add('       RADTIPOETAPA    TE,                         ');
        Sql.Add('       RADTIPOPROCESSO TP,                         ');
        Sql.Add('       USUARIOSISTEMA  USU                         ');
        Sql.Add(' WHERE                                             ');
        Sql.Add('      (IE.IDPROCESSO     = IP.IDPROCESSO)          ');
        DtmRelRAD.LbProc.Caption := ' TODOS ';
        If Trim(edNumProc.Text) <> '' Then
          Begin
             Sql.Add(' AND (IP.IDPROCESSO = '+edNumProc.Text+')');
             DtmRelRAD.LbProc.Caption := ' Processo Nº '+edNumProc.Text;
          End
        Else
          Begin
            If Trim(dblcProc.Text) <> '' Then
               Begin
                  Sql.Add(' AND (TP.IDTIPOPROCESSO = '+dblcProc.LookUpValue+')');
                  DtmRelRAD.LbProc.Caption := ' Processos do Tipo   '+dblcProc.Text;
               End;
            If (RgProc.ItemIndex = 1) And ( Trim(dblcProc.Text) = '') Then
               Begin
                  Sql.Add(' AND (IP.FLGOK <> ''S'')');
                  DtmRelRAD.LbProc.Caption := ' Processos só pendentes ';
               End
            Else
            If (RgProc.ItemIndex = 1) And ( Trim(dblcProc.Text) <> '') Then
               Begin
                   Sql.Add(' AND (IP.FLGOK <> ''S'')');
                   DtmRelRAD.LbProc.Caption := ' Processos do Tipo   '+dblcProc.Text + ' e só pendentes ';
               End;
            If (RgProc.ItemIndex = 2) And ( Trim(dblcProc.Text) = '') Then
               Begin
                  Sql.Add(' AND (IP.FLGOK <> ''S'') AND (IP.DATAFIMPREV < TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY'') )');
                  DtmRelRAD.LbProc.Caption := ' Processos em atraso ';
               End
            Else
            If (RgProc.ItemIndex = 2 ) And ( Trim(dblcProc.Text) <> '') Then
               Begin
                   Sql.Add(' AND (IP.FLGOK <> ''S'') AND (IP.DATAFIMPREV < TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY'') )');
                   DtmRelRAD.LbProc.Caption := ' Processos do Tipo   '+dblcProc.Text + ' em atraso  ';
               End;
          End;
        Sql.Add('    AND (IP.IDPESSRESP     = P.IDPESSOA(+))        ');
        Sql.Add('    AND (IE.IDTIPOETAPA    = TE.IDTIPOETAPA)       ');
        Sql.Add('    AND (TP.IDTIPOPROCESSO = IP.IDTIPOPROCESSO)    ');
        Sql.Add('    AND (AUT.IDPROCESSO    = IP.IDPROCESSO)        ');
        Sql.Add('    AND (AUT.IDUSUARIO     = USU.IDUSUARIO)        ');
        Sql.Add('    AND (AUT.IDETAPA       = IE.IDETAPA)           ');
        Sql.Add(' ORDER BY  TP.NOME,IE.IDETAPA, IE.DATAFIMPREV ');
        Open;
     End;
End;


procedure TFrmParamAcompProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamAcompProc.FormCreate(Sender: TObject);
begin
  inherited;
  DtmRelRAD.qryProc.Close;
  DtmRelRAD.qryProc.ParamByName('IDUSUARIO').AsInteger := Sistema.idUsuario;
  DtmRelRAD.qryProc.Open;
end;

end.
