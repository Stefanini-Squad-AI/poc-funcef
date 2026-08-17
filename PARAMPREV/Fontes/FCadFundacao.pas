// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Augusto
//  Pendência  : 21348
//  Data       : 15/01/2007
//  Descrição  : Nova opção para indicar seo acerto no beneficio de pensão será
//               feito no próprio ou nos beneficiários restantes.               
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : LeParam
//  Pendência  : ----
//  Data       : 06.01.2004
//  Descrição  : Criação do Parâmetro prmFLGENVACERTOFALEC
//------------------------------------------------------------------------------
unit FCadFundacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, Pessoa,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask, wwdbedit,  ExtDlgs, Wwdbspin, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, CMDBLookupCombo, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, TREdit;

type
  TfrmCadFundacao = class(TfrmPessoa)
    tbsFundacao: TTabSheet;
    pnlFundacao: TPanel;
    qryAux: TwwQuery;
    Label2: TLabel;
    Label23: TLabel;
    dbedCodigoSPC: TwwDBEdit;
    Edit1: TEdit;
    QryRegra: TwwQuery;
    qryRegraCalcINSS: TwwDBLookupCombo;
    Label17: TLabel;
    dbrgrpAcertoFalecido: TDBRadioGroup;
    DbRdgAcertoPensao: TDBRadioGroup;
    procedure qrySubTipoBeforePost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFundacao: TfrmCadFundacao;

implementation

uses UAdmPrev, UMensErro, Usistema;

{$R *.DFM}

procedure TfrmCadFundacao.qrySubTipoBeforePost(DataSet: TDataSet);
begin
  inherited;
  qrySubTipo.FieldByName('FLGTIPOPREVIDENC').AsString := 'F';
end;

procedure TfrmCadFundacao.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if not prmflgMultiFundacao
  then begin
     MsgDlg('Sistema Mono-Fundação. Não é permitido incluir novas fundações.','Informação',mtInformation,[mbOk,mbHelp],0);
     bbtnCancelarClick(Sender);
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT 1  FROM DUAL');
     qryAux.Open;
     Exit;
  end;

end;

procedure TfrmCadFundacao.FormCreate(Sender: TObject);
begin
 
  inherited;

end;

procedure TfrmCadFundacao.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
