unit FMarcaRecPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables, Db,
  Wwdatsrc, Wwquery;

type
  TfrmMarcaRecPag = class(TfrmOkCancelar)
    pnlDocAbertoPag: TPanel;
    pnlDocAbertoRec: TPanel;
    dbgrAbertoCAP: TwwDBGrid;
    qryAbertoCAR: TwwQuery;
    dsAbertoCAR: TwwDataSource;
    updAbertoCAR: TUpdateSQL;
    qryAbertoCARDESCRICAO: TStringField;
    qryAbertoCARCODPORTADOR: TFloatField;
    qryAbertoCARDATACFLOAT: TDateTimeField;
    qryAbertoCARDATAPROGRAMADA: TDateTimeField;
    qryAbertoCARDATAVENCTO: TDateTimeField;
    qryAbertoCARSALDO: TFloatField;
    qryAbertoCARRAZAOSOCIAL: TStringField;
    qryAbertoCAROBS: TMemoField;
    qryAbertoCARDATALANCTO: TDateTimeField;
    qryAbertoCARNUMDOC: TStringField;
    qryAbertoCARNUMAPGR: TFloatField;
    dbgrAbertoCAR: TwwDBGrid;
    qryAbertoCARFLGCONFIRMARECPAG: TStringField;
    qryAbertoCAP: TwwQuery;
    dsAbertoCAP: TwwDataSource;
    updAbertoCAP: TUpdateSQL;
    qryAbertoCARCODDOCUMENTO: TFloatField;
    sbInvSelCAR: TSpeedButton;
    sbMarcaTCAR: TSpeedButton;
    sbMarcaTCAP: TSpeedButton;
    sbInvSelCAP: TSpeedButton;
    qryAbertoCAPDESCRICAO: TStringField;
    qryAbertoCAPCODPORTADOR: TFloatField;
    qryAbertoCAPCODDOCUMENTO: TFloatField;
    qryAbertoCAPDATACFLOAT: TDateTimeField;
    qryAbertoCAPDATAPROGRAMADA: TDateTimeField;
    qryAbertoCAPDATAVENCTO: TDateTimeField;
    qryAbertoCAPSALDO: TFloatField;
    qryAbertoCAPRAZAOSOCIAL: TStringField;
    qryAbertoCAPOBS: TMemoField;
    qryAbertoCAPDATALANCTO: TDateTimeField;
    qryAbertoCAPNUMDOC: TStringField;
    qryAbertoCAPNUMAPGR: TFloatField;
    qryAbertoCAPFLGCONFIRMARECPAG: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbMarcaTCARClick(Sender: TObject);
    procedure sbInvSelCARClick(Sender: TObject);
    procedure sbMarcaTCAPClick(Sender: TObject);
    procedure sbInvSelCAPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarcaRecPag: TfrmMarcaRecPag;

implementation

uses uMensErro, uDataBase, DBaseDados, uSistema, uFuncaoGeral,
     uModulo, FData, uDocumento;
{$R *.DFM}

procedure TfrmMarcaRecPag.FormCreate(Sender: TObject);
begin
  inherited;
  if Modulo.sConfirmaRecPag = 'N' then begin
     MsgDlg('Seu parâmetro não permite operação nesta tela','Aviso',mtWarning,[mbOK],0);
     bbtnSair.Click;
  end;
  //
  qryAbertoCAR.Close;
  qryAbertoCAR.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAbertoCAR.ParamByName('pDATAREF').AsString   := DateToStr(Date);
  qryAbertoCAR.Open;
  //
  qryAbertoCAP.Close;
  qryAbertoCAP.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAbertoCAP.ParamByName('pDATAREF').AsString   := DateToStr(Date);
  qryAbertoCAP.Open;
  //
end;

procedure TfrmMarcaRecPag.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmData,frmData);
  FrmData.ShowModal;
  Try
     AplicaAlteracoes([qryAbertoCAR,qryAbertoCAP]);
     MsgDlg('Marcação Efetuada com Sucesso','Aviso',mtWarning,[mbOK],0);
  Except
     MsgDlg('Marcação NÃO foi efetuada','Aviso',mtWarning,[mbOK],0);
     Raise;
  end;
end;

procedure TfrmMarcaRecPag.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if qryAbertoCAR.UpdatesPending or qryAbertoCAP.UpdatesPending then begin
     if MsgDlg('Confirma Abandonar as Marcações Efetuadas','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        qryAbertoCAR.CancelUpdates;
        qryAbertoCAP.CancelUpdates;
     end;
  end;
end;

procedure TfrmMarcaRecPag.sbMarcaTCARClick(Sender: TObject);
begin
  inherited;
  qryAbertoCAR.First;
  While not qryAbertoCAR.EOF do begin
     qryAbertoCAR.Edit;
     qryAbertoCARFLGCONFIRMARECPAG.AsString := 'S';
     qryAbertoCAR.Post;
     qryAbertoCAR.Next;
  end;
  qryAbertoCAR.First;
end;

procedure TfrmMarcaRecPag.sbInvSelCARClick(Sender: TObject);
begin
  inherited;
  qryAbertoCAR.First;
  While not qryAbertoCAR.EOF do begin
     qryAbertoCAR.Edit;
     If qryAbertoCARFLGCONFIRMARECPAG.AsString = 'S' then
        qryAbertoCARFLGCONFIRMARECPAG.AsString := 'N'
     else
        qryAbertoCARFLGCONFIRMARECPAG.AsString := 'S';
     qryAbertoCAR.Post;
     qryAbertoCAR.Next;
  end;
  qryAbertoCAR.First;
end;

procedure TfrmMarcaRecPag.sbMarcaTCAPClick(Sender: TObject);
begin
  inherited;
  qryAbertoCAP.First;
  While not qryAbertoCAP.EOF do begin
     qryAbertoCAP.Edit;
     qryAbertoCAPFLGCONFIRMARECPAG.AsString := 'S';
     qryAbertoCAP.Post;
     qryAbertoCAP.Next;
  end;
  qryAbertoCAP.First;
end;

procedure TfrmMarcaRecPag.sbInvSelCAPClick(Sender: TObject);
begin
  inherited;
  qryAbertoCAP.First;
  While not qryAbertoCAP.EOF do begin
     qryAbertoCAP.Edit;
     If qryAbertoCAPFLGCONFIRMARECPAG.AsString = 'S' then
        qryAbertoCAPFLGCONFIRMARECPAG.AsString := 'N'
     else
        qryAbertoCAPFLGCONFIRMARECPAG.AsString := 'S';
     qryAbertoCAP.Post;
     qryAbertoCAP.Next;
  end;
  qryAbertoCAP.First;
end;

end.
