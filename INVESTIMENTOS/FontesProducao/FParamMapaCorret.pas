unit FParamMapaCorret;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, OleCtrls,
  vcf1, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamMapaCorret = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label4: TLabel;
    DbLkcCorretora: TwwDBLookupCombo;
    QryCorretora: TwwQuery;
    QryCorretoraIDCORRETVALORES: TFloatField;
    QryCorretoraSGLCORRETVALORES: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamMapaCorret: TFrmParamMapaCorret;

implementation

{$R *.DFM}

Uses USistema, uMensErro, DmRelatoriosClaudio, UBibliotecaInvest, dOperacaoInvest, UOperacaoInvest,
     UOperComum, dOperComum;

Procedure TFrmParamMapaCorret.FazQry;
Var
  LinhaSQL : String;
  wTotDespLiq : Double;
Begin                                              
// Acerta Labels de Data no Relatorio
  DtmRelatoriosClaudio.LblDataIniMapaCorret.Caption := 'Data Inicial .: '+EdDataIni.Text;
  DtmRelatoriosClaudio.LblDataFimMapaCorret.Caption := 'Data Final   .: '+EdDataFim.Text;

  With DtmRelatoriosClaudio.QryMapaCorret Do Begin
// Monta a Consulta
    LinhaSQL :=
      'SELECT  COR.IDCORRETVALORES, COR.SGLCORRETVALORES, '+
      '  SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,DES.VLRDESPOPER,0)) AS TOTPOSITIVOS, '+
      '  ABS(SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,0,DES.VLRDESPOPER))) AS TOTNEGATIVOS, '+
      ' (SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,DES.VLRDESPOPER,0)) +                '+
      '  SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,0,DES.VLRDESPOPER))) AS TOTLIQUIDO   '+
      'FROM DESPOPERINVEST DES, CORRETVALORES COR '+
      'WHERE DES.IDTIPOINVEST      = 2 AND ';

      If Trim(DbLkcCorretora.Text) <> '' Then
        LinhaSQL := LinhaSQL + 'COR.IDCORRETVALORES = '+QuotedStr(DbLkcCorretora.LookupValue)+' AND ';

      LinhaSQL := LinhaSQL +
   	     '      DES.DATAOPERACAO >= TO_DATE('+QuotedStr(EdDataIni.Text)+',''DD/MM/YYYY'') AND   '+
	     '      DES.DATAOPERACAO <= TO_DATE('+QuotedStr(EdDataFim.Text)+',''DD/MM/YYYY'') AND   '+
             '      DES.IDTIPODESPINVEST <> 16 AND   '+
	     '      DES.IDFORCLI          = COR.IDCORRETVALORES ' +

      'GROUP  BY COR.IDCORRETVALORES, COR.SGLCORRETVALORES '+
      'ORDER  BY COR.SGLCORRETVALORES ';

// Limpa e Preenche o Componente
      Sql.Clear;
      Sql.Add(LinhaSQL);

// Abre a Consulta
      Open;

// Varre a Tabela para somar os Valores
      wTotDespLiq := 0;
      While Not Eof Do Begin

        wTotDespLiq := wTotDespLiq + FieldByName('TOTLIQUIDO').AsFloat;
// Proximo Registro
        Next;
      End;

// Volta ao Primeiro Registro
      First;

  End;
  dtmRelatoriosClaudio.wTotalDespMapaCorret := wTotDespLiq;

End;

procedure TFrmParamMapaCorret.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date;
  edDataFim.Date := Date;
end;

procedure TFrmParamMapaCorret.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;

end;

procedure TFrmParamMapaCorret.edDataIniExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataIni.Text) = '' Then Begin
     MsgDlg('Data Inicial não foi preenchida','Erro',mtError,[mbOK],0);
     edDataIni.SetFocus;
  End;
end;

procedure TFrmParamMapaCorret.edDataFimExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFim.Text) = '' Then Begin
     MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
     edDataFim.SetFocus;
  End;

end;

procedure TFrmParamMapaCorret.FormShow(Sender: TObject);
begin
  inherited;
 QryCorretora.Open;
end;

procedure TFrmParamMapaCorret.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  QryCorretora.Close;
end;

end.
