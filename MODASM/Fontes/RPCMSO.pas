unit RPCMSO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, IvDictio, IvMulti, IvEMulti, Db,
  DBTables, Wwquery;

type
  TrelPCMSO = class(TrelSimples)
    qrdbNome: TQRDBText;
    qrdbNumIdent: TQRDBText;
    qrdbOrgIdent: TQRDBText;
    qrdbDatIdent: TQRDBText;
    qrdbExame: TQRDBText;
    QRLabel10: TQRLabel;
    qrdbMedEntid: TQRDBText;
    qryCartIdent: TwwQuery;
    QRDBText2: TQRDBText;
    qryExaminador: TwwQuery;
    qrbCandidato: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    qrdbDatReal: TQRDBText;
    qrlblAval: TQRLabel;
    qrdbAval: TQRDBText;
    qrlObserv: TQRLabel;
    qrlblCid: TQRLabel;
    qrdbCID: TQRDBText;
    qrlblObserv: TQRLabel;
    qrdbComent: TQRDBText;
    QRMemoCID: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape8: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape9: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape10: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText12: TQRDBText;
    qryEstab: TwwQuery;
    QRDBImage1: TQRDBImage;
    QRShape6: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRMemo1: TQRMemo;
    QRDBText5: TQRDBText;
    QRLabel12: TQRLabel;
    qrlblAssinante: TQRLabel;
    QRSysData3: TQRSysData;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relPCMSO: TrelPCMSO;

implementation

uses FCadRegOcorr, FSelRelPCMSO, uSistema, dBaseDados;

{$R *.DFM}


procedure TrelPCMSO.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRMemoCID.Caption := frmCadRegOcorr.edCID.Text;
  qrlObserv.Caption := '';
  if (frmCadRegOcorr.qryTabOcorr.FieldByName('AVALMIN').Value > 0)  then
     begin
        if  frmCadRegOcorr.qryTabOcorr.FieldByName('AVALMIN').Value >
            frmCadRegOcorr.qryDet.FieldByName('AVALIACAO').Value  then
            begin
               qrlObserv.Caption := '(INAPT';
               qrlObserv.Font.Color := clRed;
            end
        else
            begin
               qrlObserv.Caption := '(APT';
               qrlObserv.Font.Color := clGreen;
            end;
        //if  frmCadRegOcorr.tblPessoal.FieldByName('SEXO').Value = 'M' then
            qrlObserv.Caption := qrlObserv.Caption + 'O';//  else
        //    qrlObserv.Caption := qrlObserv.Caption + 'A';
        qrlObserv.Caption := qrlObserv.Caption + ')';
     end;

  if (frmCadRegOcorr.qryDet.FieldByName('DATAREAL').AsString = '') or
     (frmSelRelPCMSO.rgResultado.ItemIndex = 1) then
  begin
    qrlObserv.Caption := '';
    qrlblCid.Caption  := '';
  end;

  if (frmSelRelPCMSO.rgResultado.ItemIndex = 1) then
  begin
     qrlblAval.Caption   := '';
     qrlblObserv.Caption := '';
     qrdbComent.Enabled  := False;
  end;

  qrdbCID.Enabled   := (frmSelRelPCMSO.rgResultado.ItemIndex = 0) and (frmCadRegOcorr.qryDet.FieldByName('DATAREAL').AsString <> '');
  QRMemoCID.Enabled := (frmSelRelPCMSO.rgResultado.ItemIndex = 0) and (frmCadRegOcorr.qryDet.FieldByName('DATAREAL').AsString <> '');
  qrdbAval.Enabled  := (frmSelRelPCMSO.rgResultado.ItemIndex = 0) and (frmCadRegOcorr.qryDet.FieldByName('DATAREAL').AsString <> '');
  qrbCandidato.Enabled  := frmCadRegOcorr.dbedSit.Text = 'Candidato';
end;

procedure TrelPCMSO.FormCreate(Sender: TObject);
begin
  inherited;
  qr.ReportTitle         := frmSelRelPCMSO.edTituloFicha.Text;
  qryCartIdent.Open;
  qryExaminador.Open;
  qrlblTitRel.Caption    := qr.ReportTitle;
  qrlblAssinante.Caption := frmSelRelPCMSO.edAssinante.Text;
  qryEstab.Close;
  if bMontaSelectFunc then
    qryEstab.ParamByName('IDESTAB').AsString := frmSelRelPCMSO.MontaSelectFunc.ValoresChave[2]
  else
  begin
     dtmBaseDados.qry.Close;
     dtmBaseDados.qry.Sql.Clear;
     dtmBaseDados.qry.Sql.Add('SELECT IDPESSOA FROM PESSOA WHERE IDGRUPO =  ' +
                               IntToStr(Sistema.IdEmpresa));
     dtmBaseDados.qry.Open;
     qryEstab.ParamByName('IDESTAB').AsInteger := dtmBaseDados.qry.FieldByName('IDPESSOA').AsInteger;
     dtmBaseDados.qry.Close;
  end;
  qryEstab.Open;
end;

end.
