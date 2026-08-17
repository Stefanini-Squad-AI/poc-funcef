unit FAcertaImposto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, ComCtrls;

type
  TfrmAcertaImposto = class(TfrmSairAjuda)
    bbtnAcerta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryAlterador: TwwQuery;
    qryAlteradorCODALTERADOR: TFloatField;
    qryAlteradorDESCRICAO: TStringField;
    qryDocumento: TwwQuery;
    qryDocumentoCODDOCUMENTO: TFloatField;
    qryDocumentoCODTIPDOC: TFloatField;
    qryDocumentoVLRLIQUIDO: TFloatField;
    qryDocumentoVALOR: TFloatField;
    qryDocumentoDATAPROGRAMADA: TDateTimeField;
    qryDocumentoIDFORCLI: TFloatField;
    qryDocumentoDATALANCTO: TDateTimeField;
    qryDocumentoDATAEMISSAO: TDateTimeField;
    qryDocumentoDEBCRE: TStringField;
    qryDocumentoNUMLANCTO: TFloatField;
    qryDocumentoOPERACAO: TStringField;
    prgBarAtuFluxo: TProgressBar;
    Memo1: TMemo;
    procedure bbtnAcertaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertaImposto: TfrmAcertaImposto;

implementation

Uses uSistema, uImpostoRetido, uMensErro, uDataBase, uIntegraBack;
{$R *.DFM}

procedure TfrmAcertaImposto.bbtnAcertaClick(Sender: TObject);
begin
  inherited;
  IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB','P');
  IntegraBack.RecPag := 'P';
  prgBarAtuFluxo.Visible := true;
  qryDocumento.Close;
  qryDocumento.ParamByName('IDPESSOA').AsInteger     := Sistema.idEmpresa;
  qryDocumento.Open;
  qryDocumento.First;
  Try
     StartTransacao;
     prgBarAtuFluxo.Max      := qryDocumento.RecordCount;
     prgBarAtuFluxo.Position := 0;
     While not qryDocumento.EOF do begin
        prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
        ImpostoRetido.DataProgramada    := qryDocumentoDATAPROGRAMADA.AsDateTime;
        ImpostoRetido.OperacaoDocumento := qryDocumentoOPERACAO.AsString;
        ImpostoRetido.IdForCli          := qryDocumentoIDFORCLI.AsInteger;
        ImpostoRetido.CodDocumento      := qryDocumentoCODDOCUMENTO.AsInteger;
        ImpostoRetido.NumLancto         := qryDocumentoNUMLANCTO.AsInteger;
        ImpostoRetido.ValorLancto       := qryDocumentoVALOR.AsFloat;
        ImpostoRetido.ValorLiquido      := qryDocumentoVLRLIQUIDO.AsFloat;
        ImpostoRetido.DataLancto        := qryDocumentoDATALANCTO.AsDateTime;
        ImpostoRetido.DataEmissao       := qryDocumentoDATAEMISSAO.AsDateTime;
        ImpostoRetido.DebCre            := qryDocumentoDEBCRE.AsString;
        ImpostoRetido.MomentoLancamento := mlLancamento;
        ImpostoRetido.CodTipoDoc        := qryDocumentoCODTIPDOC.AsInteger;
        ImpostoRetido.Incluir;
        qryDocumento.Next;
     end;
     CommitTransacao;
     prgBarAtuFluxo.Visible := False;
     IntegraBack.BuscaParamIntegra('PARAMFINANC','INTEGRACONTAB',' ');
     MsgDlg('Acerto Efetuado com Sucesso','Aviso',mtWarning,[mbOk],0);
  Except
     RollBackTransacao;
     prgBarAtuFluxo.Visible := False;
     IntegraBack.BuscaParamIntegra('PARAMFINANC','INTEGRACONTAB',' ');
     MsgDlg('Acerto NÃO Efetuado','Erro',mtError,[mbOk],0);
  End;
end;

procedure TfrmAcertaImposto.FormCreate(Sender: TObject);
begin
  inherited;
  ImpostoRetido := TImpostoRetido.Create;
  qryAlterador.Close;
  qryAlterador.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryAlterador.Open;
end;

procedure TfrmAcertaImposto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ImpostoRetido.Free;
end;

end.
