unit FAltValidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBCtrls, wwmonthcalendar;

type
  TFrmAltValidade = class(TFrmCadastroGridCS)
    qryIDITENSRECDEV: TFloatField;
    qryNUMOC: TFloatField;
    qryCODARTIGO: TStringField;
    qryCODMEDIDA: TStringField;
    qryIDMOV: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDNFRECEBDEVOL: TFloatField;
    qryQTDERECEBDEVOL: TFloatField;
    qryVLRUNITARIO: TFloatField;
    qryVLRESTOQUE: TFloatField;
    qryVALORTOTAL: TFloatField;
    qryDATAVALIDADE: TDateTimeField;
    qryIDPRODVARI: TFloatField;
    qryDESCPROD: TStringField;
    qryNUMNOTA: TStringField;
    qryRAZAOSOCIAL: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    DBText1: TDBText;
    qryCODALMOXARIFADO: TFloatField;
    calendario: TwwDBMonthCalendar;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    rQtde, rQtdeSaldo : Double;
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmAltValidade: TFrmAltValidade;

implementation

{$R *.DFM}

Uses uSistema, uMovNew, uDataBase,UConversaoMed, uMensErro;

procedure TFrmAltValidade.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('NFRECEBDEVOL.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('NFRECEBDEVOL.FLGTIPONOTA = ''R''');
  Sel(-1);
end;

procedure TFrmAltValidade.Sel(n: Double);
begin
   qry.Close;
   qry.ParamByName('IDNFRECEBDEVOL').AsFloat := n;
   qry.Open;
end;

procedure TFrmAltValidade.FormShow(Sender: TObject);
begin
  inherited;
  dbGrd.BringToFront;
end;

procedure TFrmAltValidade.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmAltValidade.CmeCadastroConfirma(Sender: TObject);
begin
  Try
     StartTransacao;
     //-------------------------------------------------------------------------
     // Exclui o lote Anterior
     //-------------------------------------------------------------------------
     MovNew.SaiLoteVali(qryCODALMOXARIFADO.AsInteger,
                        qryCODARTIGO.AsString,
                        qryDATAVALIDADE.AsString,
                        (rQtde*-1),-1);
     //-------------------------------------------------------------------------
     // Entra com o novo lote
     //-------------------------------------------------------------------------
     MovNew.EntraLoteVali(qryCODALMOXARIFADO.AsInteger,
                          qryCODARTIGO.AsString,
                          DateToStr(calendario.Date),
                          rQtde);
     //-------------------------------------------------------------------------
     // Atualiza a data na tabela dos itens nota
     //-------------------------------------------------------------------------
     if qry.State = dsBrowse then qry.Edit;
     qryDATAVALIDADE.AsDateTime := calendario.Date;
     qry.Post;
     qry.ApplyUpdates;
     qry.CommitUpdates;

     CommitTransacao;
  Except
     RollBackTransacao;
     Raise;
  End;
  inherited;

end;

procedure TFrmAltValidade.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  Calendario.Date := qryDATAVALIDADE.AsDateTime;
end;

procedure TFrmAltValidade.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  rQtde:=ConversaoMed.ConverteQtdeUnCM(qryCODARTIGO.AsString,qryCODMEDIDA.AsString,qryQTDERECEBDEVOL.AsFloat);
  rQtdeSaldo:=MovNew.InfoSaldoValidade(qryCODALMOXARIFADO.AsInteger,qryCODARTIGO.AsString,qryDATAVALIDADE.AsString);
  if rQtde > rQtdeSaldo then
     Begin
        MsgDlg('Produto não tem saldo sufuciente nesta data de validade','Erro',mtError,[mbOk],0);
        Accept := False;
     end;


end;

end.
