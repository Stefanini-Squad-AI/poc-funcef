unit FCadConvenioBancoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Wwdbspin, Mask, wwdbedit, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uCtrlSeqRemessa, uCtrlPadroes, uMensErro, uCtrlParamIntegra,
  DBTables, Wwquery, uCmSqlParams;

type
  TFrmCadConvenioBancoMT = class(TFrmCadastroMT)
    wwDBEdit1: TwwDBEdit;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBEdit2: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadConvenioBancoMT: TFrmCadConvenioBancoMT;
  CtrlSeqRemessa: TCtrlSeqRemessa;

implementation

{$R *.DFM}

procedure TFrmCadConvenioBancoMT.FormCreate(Sender: TObject);

begin
  inherited;
  CtrlSeqRemessa := TCtrlSeqRemessa.Create;
  CtrlSeqRemessa.InitializeAs( Padroes );
  CtrlSeqRemessa.cds := cds;
  cds.Data := CtrlSeqRemessa.ListSeqRemessa('-1');

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30049;
    bbtnAjuda.HelpContext := 30049;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TFrmCadConvenioBancoMT.FormDestroy(Sender: TObject);
begin
  CtrlSeqRemessa.free;
  inherited;
end;

procedure TFrmCadConvenioBancoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);

begin

  if trim(cds.fieldByName('NUMEMPRESABANCO').asString) = '' then
  begin
    MsgDlg('Número da Empresa no Banco Não Pode Ser Em Branco!','Erro',mtError,[mbOK],0);
  end;

    inherited;

end;

procedure TFrmCadConvenioBancoMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  if not ctrlSeqRemessa.GravarSeqRemessa then
  begin
    MsgDlg('Ocorreu um Erro ao Gravar o Convênio Bancário!','Erro',mtError,[mbOK],0);
  end;

end;

procedure TFrmCadConvenioBancoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaSelect.RetornouValor then
    cds.Data := CtrlSeqRemessa.ListSeqRemessa(montaSelect.ValoresChave[0]);

end;

procedure TFrmCadConvenioBancoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  //05/09/2006 - p:23167 - catia
    CDSAux.Close;

        SQLAUX.SQL.Text := 'SELECT NODOCUMENTO, COMPLDOCUMENTO  FROM DOCUMENTO '+
                            'WHERE CODDOCUMENTO =  ( SELECT MAX(CODDOCUMENTO)  '+
                            'FROM DOCUMENTO D, PORTADORFORMA PF, SEQREMESSA S '+
                            'WHERE D.CODPORTFORMA = PF.CODPORTFORMA AND  '+
                            'PF.NUMEMPRESABANCO = S.NUMEMPRESABANCO AND  '+
                            'S.NUMEMPRESABANCO = ''' + Cds.fieldbyname('NUMEMPRESABANCO').Asstring +''')';

         sqlAux.Open;
         if  NOT CDSAUX.IsEmpty then
         begin
              MsgDlg('Não é possível alterar os parâmetros do Convênio Bancário, pois já existe o documento  ' +
              trim(CDSAux.FieldByName('NODOCUMENTO').AsString) + ' - ' +
              trim(CDSAux.FieldByName('COMPLDOCUMENTO').AsString) + ' vinculado a este convênio.',
              'Aviso',mtWarning,[mbOk],0);
               bbtncancelarclick(sender);
         end ;


end;

end.
