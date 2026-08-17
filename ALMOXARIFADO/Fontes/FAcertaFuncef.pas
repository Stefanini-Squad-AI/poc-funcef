unit FAcertaFuncef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery;

type
  TFrmAcertaFuncef = class(TfrmSairAjuda)
    btnAcerta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label1: TLabel;
    qry: TwwQuery;
    upd: TUpdateSQL;
    qryIDMOV: TFloatField;
    qryIDITENSRECDEV: TFloatField;
    qryCODMEDIDA: TStringField;
    qryIDEMPRESA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryCODARTIGO: TStringField;
    qryCODALMOXARIFADO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryQTDERECEBDEVOL: TFloatField;
    qryVLRUNITARIO: TFloatField;
    qryVLRESTOQUE: TFloatField;
    qryDATAENTDEVOL: TDateTimeField;
    qryNUMNF: TFloatField;
    qryCOMPLNF: TStringField;
    qryDATAVALIDADE: TDateTimeField;
    procedure btnAcertaClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Acertar;
  public
    { Public declarations }
  end;

var
  FrmAcertaFuncef: TFrmAcertaFuncef;

implementation

Uses uModulo, uMovNew, uDataBase, uMensErro, uSistema;

{$R *.DFM}

Procedure TFrmAcertaFuncef.Acertar;
Var
  idMov       : LongInt;
  iCodCusteio : longInt;
Begin
   Try
      StartTransacao;
      qry.Open;
      qry.First;
      While Not qry.EOF Do
         Begin
            iCodCusteio := Modulo.LeUnCusteio(qryCODALMOXARIFADO.AsInteger);
            idMov :=  MovNew.GeraMov('E',
                                      qryVLRESTOQUE.AsFloat,
                                      qryQTDERECEBDEVOL.AsFloat,
                                      iCodCusteio,
                                      qryCODALMOXARIFADO.AsInteger,
                                      qryCODARTIGO.AsString,
                                      '',
                                      'A',
                                      qryCODMEDIDA.AsString,
                                      '',
                                      DateToStr(Date),
                                      qryNUMNF.AsString+'/'+qryCOMPLNF.AsString,
                                      '', { centro de custo }
                                      Sistema.IdEmpresa,-1,0);
             If idMov <= 0 Then
                Abort;
             qry.Edit;
             qryIDMOV.AsInteger := idMov;
             qry.Post;
             qry.Next;
         End;
       qry.ApplyUpdates; 
       CommitTransacao;
       MsgDlg('Alteração Gravada com Sucesso','informação',mtInformation,[mbOk],0);
   Except
      RollBackTransacao;
      Raise;
   End;
End;

procedure TFrmAcertaFuncef.btnAcertaClick(Sender: TObject);
begin
  inherited;
  Acertar; 
end;

end.

