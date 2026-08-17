unit RRubAssNaoPagas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RHeadFoot, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TrelRubNaoPagas = class(TrelHeadFoot)
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    qryPlano: TwwQuery;
    dsPlano: TwwDataSource;
    qryRubricas: TwwQuery;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qrlblMesRef: TQRLabel;
    qrlblMesCob: TQRLabel;
    qrlblPlano: TQRLabel;
    qrdbtxtPlano: TQRDBText;
    qrdbtxtContribuicao: TQRDBText;
    qrdbtxtQtde: TQRDBText;
    qrlblTexto: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    QRSubDetail4: TQRSubDetail;
    qryParticipante: TwwQuery;
    dsRubricas: TwwDataSource;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    qryInfo: TwwQuery;
    qrshContrib: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure qrBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
     bNaoExistemPlanos : boolean;

  public
    { Public declarations }
  end;

var
  relRubNaoPagas: TrelRubNaoPagas;

implementation

uses FCliente;

{$R *.DFM}

procedure TrelRubNaoPagas.qrBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
//  GetRegNomeCliente(qrlblNomeCli,'Assistencial');
  bNaoExistemPlanos := True;

end;

procedure TrelRubNaoPagas.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if qryRubricas.isempty
  then PrintBand := False
  else begin
    PrintBand := True;
    bNaoExistemPlanos := False;
  end;

end;

procedure TrelRubNaoPagas.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if bNaoExistemPlanos
  then PrintBand := True
  else PrintBand := False;
  bNaoExistemPlanos := True;

end;




end.
