unit fCadCotaTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, dBaseDados, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uSistema, uCmTypes, uMensErro, uCtrlCotatipooper, Mask,
  wwdbedit, uCmSqlParams, DBCtrls, Wwdotdot, uVerificaPreenchimento, Wwdbcomb;


type
  TfrmCadCotatipooper = class(TFrmCadastroGridMTCotas)
    edDescricao: TwwDBEdit;
    Label1: TLabel;
    rdDescReceita: TDBRadioGroup;
    rdDescCota: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);

    protected
    procedure FazerRefresh; override;



  private
    { Private declarations }
    CtrlCotaTipoOper : TCtrlCotaTipoOper;
    procedure MensErroMt( sMsgInfo: string );
    function VerificaPreenchimento : boolean;


  public
    { Public declarations }
  end;

var
  frmCadCotatipooper: TfrmCadCotatipooper;

implementation

{$R *.DFM}

procedure TfrmCadCotatipooper.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlCotaTipoOper.ListaCota;
end;




procedure TfrmCadCotatipooper.FormCreate(Sender: TObject);
begin
  CtrlCotaTipoOper  :=  TCtrlCotatipooper.Create;
  CtrlCotaTipoOper.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       MensErroMT);

  CtrlCotaTipoOper.cdsCotatipooper := cds;
  FazerRefresh;
  inherited;
end;




procedure TfrmCadCotatipooper.MensErroMt(sMsgInfo: string);
begin
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TfrmCadCotatipooper.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCotaTipoOper.GravarCota;
end;

procedure TfrmCadCotatipooper.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  rdDescReceita.ItemIndex := 0;
  rdDescCota.ItemIndex := 0;
end;



function TfrmCadCotatipooper.VerificaPreenchimento: boolean;
var
iIDCotaTiopoOper : integer;

begin
  Result := false;
  try
    if edDescricao.Text = '' then
    raise EValidacao.CreateVal('O campo ''DESCRIÇÃO'' não pode estar em branco', edDescricao)
      else if edDescricao.Text[1] = ' ' then
    raise EValidacao.createVal('O campo ''DESCRIÇÃO'' não pode estar com o primeiro caráctere nulo',edDescricao)
      else if CmeCadastro.Operacao = opInserir then iIDCotaTiopoOper := -1 else iIDCotaTiopoOper := Cds.FieldByName('IDCOTATIPOOPER').AsInteger;
    if CtrlCotaTipoOper.VerificaLancCadastrado(edDescricao.Text, iIDCotaTiopoOper) then
        raise EValidacao.createVal ('Já existe um lançamento cadastrado com esta descrição',edDescricao);

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;


procedure TfrmCadCotatipooper.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadCotatipooper.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadCotatipooper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlCotaTipoOper);
end;

procedure TfrmCadCotatipooper.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCotaTipoOper.GravarCota;
end;

end.
