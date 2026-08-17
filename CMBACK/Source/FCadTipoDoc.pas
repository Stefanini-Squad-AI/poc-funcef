(*******************************************************************************
 03/11/1999 - 2.14.10
  Alteração no layout do grid > Passou a ser exibido a descrição do alterador e
  a indicação de acréscimo/decréscimo;
  Otimização na consulta dos Tipos de Docoumentos.
 30/12/1999 - 2.14.18
  Inclusão da classifiacação do documento como documento fiscal;
  Indicação do tipo do documento com relação ao engloba/parcela: O Tipo do
  Documento pode caracaterizar sempre um engloba/parcela, pode não caracterizar
  um engloba/parcela ou pode ser definido pelo usuário no momento do lançamento
  do mesmo;
 25/12/2000 - 2.16.04
  Inclusão da opção do tipo de documento gerar automaticamente o Número do
  Documento a ser cadastrado.
 17/12/2000 - 2.07.00
  Inclusão da indicação 'Consiste em Documento Bancário' para o tipo de documento
*******************************************************************************)


unit FCadTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, Db, DBTables, CMwwQuery, cmseldlg, wwidlg, Wwdatsrc,
  DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, TB97, TB97Ctls, TB97Tlbr,
  FCadastroGrid, MontaSelect, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList;

type
  TfrmCadTipoDoc = class(TfrmCadastroGridCS)
    Label1: TLabel;
    dbedDescricao: TDBEdit;
    Panel1: TPanel;
    sbtnAcrescimo: TSpeedButton;
    sbtnDecrescimo: TSpeedButton;
    qryCODTIPDOC: TFloatField;
    qryDESCRICAO: TStringField;
    qryDEBCRE: TStringField;
    qryRECPAG: TStringField;
    qryIDUSUARIOINCLUSAO: TFloatField;
    qryCalcAcrescimo: TStringField;
    qryCalcDecrescimo: TStringField;
    qryCalcDebCre: TStringField;
    Label2: TLabel;
    dbeCodReduzido: TDBEdit;
    CkbDocFiscal: TDBCheckBox;
    RgEmgParcela: TDBRadioGroup;
    Bevel1: TBevel;
    qryFLGENGLOBAPARCELA: TStringField;
    qryFLGDOCFISCAL: TStringField;
    qryCODREDUZIDO: TStringField;
    qryFLGGERANUMDOC: TStringField;
    CkbGeraNumDoc: TDBCheckBox;
    qryFLGDOCBANCARIO: TStringField;
    qryFLGSERVICO: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAcrescimoClick(Sender: TObject);
    procedure sbtnDecrescimoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sSql : String;
  end;

var
  frmCadTipoDoc: TfrmCadTipoDoc;

implementation

uses USistema, UMensErro, UAutorizacao,  Udatabase, uIntegraBack;

{$R *.DFM}

procedure TfrmCadTipoDoc.bbtnConfirmarClick(Sender: TObject);
begin
   if (dbedDescricao.Text) = ''
   then begin
      MsgDlg('Descriçao obrigatória','Erro',mtError,[mbOK],0);
      dbedDescricao.SetFocus;
      Exit;
   end;
   inherited;
end;

procedure TfrmCadTipoDoc.sbtnAcrescimoClick(Sender: TObject);
begin
   inherited;
   if IntegraBack.RecPag = 'P' then
      qryDebCre.AsString := 'C'
   else
      qryDebCre.AsString := 'D';
   sbtnAcrescimo.Down := True;
end;

procedure TfrmCadTipoDoc.sbtnDecrescimoClick(Sender: TObject);
begin
   inherited;
   if IntegraBack.RecPag = 'P' then
      qryDebCre.AsString := 'D'
   else
      qryDebCre.AsString := 'C';
   sbtnDecrescimo.Down := True;
end;

procedure TfrmCadTipoDoc.FormCreate(Sender: TObject);
begin
  If Qry.Active Then Qry.Close;
  If Not Qry.Prepared Then Qry.Prepare;
  Qry.ParamByname('RECPAG').AsString := IntegraBack.RecPag;
  Qry.Open;
  inherited;
  MontaSelect.Filtro.Text := 'TIPODOCRECPAG.RECPAG = '''  + IntegraBack.RecPag + '''';
end;

procedure TfrmCadTipoDoc.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   qryFLGENGLOBAPARCELA.AsString  := 'A';
   qryRecPag.AsString             := IntegraBack.RecPag;
   qryIdUsuarioInclusao.AsInteger := Sistema.idUsuario;
   qryCodTipDoc.value             := leultregistro(nil,'TIPODOCRECPAG');;
   qryFLGGERANUMDOC.AsString      := 'N';
   qryFLGDOCFISCAL.AsString       := 'S';
   qryFLGSERVICO.AsString         := 'N';
   if IntegraBack.RecPag = 'P'  then
      qryDebCre.AsString := 'C'
   else
      qryDebCre.AsString := 'D';

  dbedDescricao.SetFocus;
End;

procedure TfrmCadTipoDoc.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   if IntegraBack.RecPag = 'P'
   then begin
      sbtnAcrescimo.Down := qryDebCre.AsString = 'C';
      sbtnDecrescimo.Down := qryDebCre.AsString = 'D';
   end
   else begin
      sbtnAcrescimo.Down := qryDebCre.AsString = 'D';
      sbtnDecrescimo.Down := qryDebCre.AsString = 'C';
   end;
   dbedDescricao.SetFocus;
End;

procedure TfrmCadTipoDoc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count <> 0) AND (Trim(MontaSelect.ValoresChave[0]) <> '') Then
      Qry.Locate('CODTIPDOC',MontaSelect.ValoresChave[0],[]);
End;

procedure TfrmCadTipoDoc.qryCalcFields(DataSet: TDataSet);
begin
  inherited;
  with qry do begin
      if IntegraBack.RecPag = 'P'
      then begin
         //Contas a Pagar
         if FieldByName('DebCre').AsString = 'C'
         then begin
            FieldByName('calcDebCre').AsString := 'Acréscimo';
            FieldByName('calcAcrescimo').AsString := 'C';
            FieldByName('calcDecrescimo').AsString := '';
         end
         else begin
            FieldByName('calcDebCre').AsString := 'Decréscimo';
            FieldByName('calcDecrescimo').AsString := 'D';
            FieldByName('calcAcrescimo').AsString := '';
         end
      end
      else begin
         //Contas a Receber
         if FieldByName('DebCre').AsString = 'C'
         then begin
            FieldByName('calcDebCre').AsString := 'Decréscimo';
            FieldByName('calcAcrescimo').AsString := '';
            FieldByName('calcDecrescimo').AsString := 'D';
         end
         else begin
            FieldByName('calcDebCre').AsString := 'Acréscimo';
            FieldByName('calcAcrescimo').AsString := 'C';
            FieldByName('calcDecrescimo').AsString := '';
         end;
      end;
   end;
end;

procedure TfrmCadTipoDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If Qry.Active Then Qry.Close;
  If Qry.Prepared Then Qry.UnPrepare;
end;

End.
