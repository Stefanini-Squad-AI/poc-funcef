{*******************************************************}
{                                                       }
{ Softtek                                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Renan Cristiano                 }
{ Atualizado Em: 14/04/2010                             }
{                                                       }
{*******************************************************}

unit FHistoricoItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, Wwdatsrc;

type
  TFrmHistoricoItens = class(TForm)
    pnlFundo: TPanel;
    pnlControles: TPanel;
    dbgdHistrorico: TwwDBGrid;
    pnlTitulo: TPanel;
    Panel1: TPanel;
    lblQdt: TfcLabel;
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    QryHistrorico: TwwQuery;
    QryHistroricoDATANECESSIDADE: TDateTimeField;
    QryHistroricoQTDFINAL: TFloatField;
    QryHistroricoCODMEDIDA: TStringField;
    lblTitulo: TfcLabel;
    DsHistorico: TwwDataSource;
    lblDesc: TfcLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistoricoItens: TFrmHistoricoItens;

implementation
uses
  FMTCadReq, uMensErro;

{$R *.DFM}

procedure TFrmHistoricoItens.bbtnConfirmarClick(Sender: TObject);
begin
  FrmMTCadReq.bConfirmaItem := True;
  Close;
end;

procedure TFrmHistoricoItens.bbtnCancelarClick(Sender: TObject);
begin
  FrmMTCadReq.bConfirmaItem := False;
  Close;
end;

procedure TFrmHistoricoItens.FormShow(Sender: TObject);
begin
  Try
     with QryHistrorico do
     begin
       Close;
       sql.Clear;
       sql.add('SELECT DATANECESSIDADE, ROUND(QTDFINAL, 2) AS QTDFINAL, CODMEDIDA FROM ( ');
       sql.add(' ');
       sql.add('SELECT RM.DATANECESSIDADE, ');
       sql.add('       CASE ');
       sql.add('         WHEN CO.CODMEDIDA = CF.CODMEDIDA THEN ');
       sql.add('          IP.QTDEPEDIDA ');
       sql.add('         ELSE ');
       sql.add('          (IP.QTDEPEDIDA * CO.FATOR / CF.FATOR) ');
       sql.add('       END AS QTDFINAL, ');
       sql.add('       CF.CODMEDIDA ');
       sql.add('  FROM REQMAT RM, ITEMPEDI IP, CONVER CO, CONVER CF, ARTIGO AR, PRODUTO PD ');
       sql.add('   WHERE RM.CODCENTROCUSTO = ' + FrmMTCadReq.Cds.FieldByName('CODCENTROCUSTO').AsString);
       sql.add('   AND IP.CODARTIGO = ' + FrmMTCadReq.CdsItem.FieldByName('CODARTIGO').AsString);
       sql.add('   AND CO.CODMEDIDA = IP.CODMEDIDA ');
       sql.add('   AND CF.CODMEDIDA = ' + QuotedStr(FrmMTCadReq.CdsItem.FieldByName('CODMEDIDA').AsString));
       sql.add('   AND RM.NUMREQUISICAO = IP.NUMREQUISICAO ');
       sql.add('   AND IP.CODARTIGO = AR.CODARTIGO ');
       sql.add('   AND AR.CODPRODUTO = PD.CODPRODUTO ');
       sql.add('   AND PD.CODPRODUTO = CO.CODPRODUTO ');
       sql.add('   AND PD.CODPRODUTO = CF.CODPRODUTO ');
       sql.add('ORDER BY DATANECESSIDADE DESC ');
       sql.add(' ');
       sql.add(')');
       sql.add('WHERE ROWNUM <= 3');
       Open;
     end;

     lblDesc.Caption := FrmMTCadReq.dblcDesc.Text;
     lblQdt.Caption := 'Solicitação atual: ' + FrmMTCadReq.cdsItem.FieldByName('QTDEPEDIDA').AsString + ' ' + UpperCase(FrmMTCadReq.dblcUn.Text);

     FrmMTCadReq.bConfirmaItem := False;
  except
    MsgDlg('Erro ao carregar o histórico de requisição do item', 'Erro', mtError, [mbOk], 0);
  end;

end;

end.
