unit RDivergContribAssParc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RHeadFoot, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc;

type
  TrelDivergContribParc = class(TrelHeadFoot)
    DetailBand1: TQRBand;
    qryPatro: TwwQuery;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    dsPatro: TwwDataSource;
    qryPlano: TwwQuery;
    qrlblPlano: TQRLabel;
    qrdbtxtPlano: TQRDBText;
    dsPlano: TwwDataSource;
    qryContribuicoes: TwwQuery;
    QRSubDetail2: TQRSubDetail;
    qrdbtxtContribuicao: TQRDBText;
    qrdbtxtQtde: TQRDBText;
    qrlblTexto: TQRLabel;
    qrlblMesRef: TQRLabel;
    qrlblMesCob: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    QRLabel2: TQRLabel;
    qryInfo: TwwQuery;
    dsContribuicoes: TwwDataSource;
    qryParticipante: TwwQuery;
    QRSubDetail4: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrshContrib: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure qrBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    bNaoExistemPlanos : boolean;

  public
    { Public declarations }
  end;

var
  relDivergContribParc: TrelDivergContribParc;

implementation

uses FCliente;

{$R *.DFM}

procedure TrelDivergContribParc.qrBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
//  GetRegNomeCliente(qrlblNomeCli,'Assistencial');
  bNaoExistemPlanos := True;
end;

procedure TrelDivergContribParc.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if qryContribuicoes.isempty
  then PrintBand := False
  else begin
    PrintBand := True;
    bNaoExistemPlanos := False;
  end;
end;

procedure TrelDivergContribParc.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if bNaoExistemPlanos
  then PrintBand := True
  else PrintBand := False;
  bNaoExistemPlanos := True;
end;




end.
