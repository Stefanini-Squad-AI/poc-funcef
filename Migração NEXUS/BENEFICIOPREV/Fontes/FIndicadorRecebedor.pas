// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Thiago Passos
// SOL         : 115358
// Kintana     : 553569
// Data        : 12/11/2009
// Alteração   : Inclusão do Campo CPF no TItular,Responsavel e Recebedor, inclusive nas consultas
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/03/2005
// Alteração   : Tratamento igual ao Cadastro de Dependentes (RESPONSAVEL / RECEBEDOR)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Data        : 14/12/2002
// Alteração   : Gravar o DATAFIMRECEB da qryDet
//------------------------------------------------------------------------------
// Rotina      : rdbProprioClick
// Autor(a)    : Gleyber
// Data        : 06/12/2002
// Alteração   : Gravar o IDPESSOA do titular se o recebedor for o proprio
//------------------------------------------------------------------------------
unit FIndicadorRecebedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, CMDBLookupCombo, Mask;

type
  TfrmIndicadorRecebedor = class(TfrmCadMestreDetalheCS)
    lblParticipante: TLabel;
    dbTNome: TDBText;
    lblPatro: TLabel;
    dbTPatro: TDBText;
    lblPlanoPrev: TLabel;
    dbTPlano: TDBText;
    lblMatricula: TLabel;
    dbTMatricula: TDBText;
    lblInscricao: TLabel;
    dbTInscricao: TDBText;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryTipoRecebedor: TQuery;
    MSResp: TMontaSelect;
    QryAux: TwwQuery;
    edPaiDetalhe: TEdit;
    dsDep: TwwDataSource;
    qryDep: TwwQuery;
    qryRecebedor: TwwQuery;
    updRecebedor: TUpdateSQL;
    dsRecebedor: TwwDataSource;
    qryBeneficio: TwwQuery;
    updDep: TUpdateSQL;
    grpbxResp: TGroupBox;
    Label9: TLabel;
    dbeRecebedor: TDBEdit;
    rdbProprio: TRadioButton;
    rdbOutro: TRadioButton;
    grpResponsavel: TGroupBox;
    Label32: TLabel;
    Label3: TLabel;
    DbLkcTipoResponsavel: TCMDBLookupCombo;
    Label10: TLabel;
    dtLimiteRecebedor: TCMDateTimePicker;
    sbResponsavel: TSpeedButton;
    sbNovoResponsavel: TSpeedButton;
    dbeResponsavel: TDBEdit;
    Label1: TLabel;
    dbeCPFResponsavel: TDBEdit;
    Label2: TLabel;
    dbeCpfRecebedor: TDBEdit;
    Label4: TLabel;
    DBText1: TDBText;
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure rdbProprioClick(Sender: TObject);
    procedure sbResponsavelClick(Sender: TObject);
    procedure sbNovoResponsavelClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sFiltroBenef ,
    OpDetalhe        : String;
    
  public
    { Public declarations }
  end;

var
  frmIndicadorRecebedor: TfrmIndicadorRecebedor;

implementation

uses FPrincipal, UAdmPrev, UMensErro, UDataBase, UCalcDV, FTelaAut, DBaseDados, FCadResponsa,
  UBeneficio, fAguarde, DAPrev, Usistema;

{$R *.DFM}

procedure TfrmIndicadorRecebedor.FormActivate(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible := False;
  sbtnApagar.Visible  := False;
  sbtnInsDet.Visible := False;
end;

procedure TfrmIndicadorRecebedor.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  edPaiDetalhe.Text := '';
  if MontaSelect.RetornouValor then  begin
    qry.Close;
    if not qry.Prepared then qry.prepare;
    qry.ParamByName('IDPESSOA').Value    := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDPESSJUR').Value   := StrToInt(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IDPLANOPREV').Value := StrToInt(MontaSelect.ValoresChave[2]);
    qry.ParamByName('SEQPROPOSTA').Value := StrToInt(MontaSelect.ValoresChave[3]);
    qry.Open;

    qryBeneficio.Close;
    if not qryBeneficio.Prepared then qryBeneficio.prepare;
    qryBeneficio.ParamByName('IDPLANOPREV').Value := StrToInt(MontaSelect.ValoresChave[2]);
    qryBeneficio.Open;

    qryDet.Close;
    if not qryDep.Prepared then qryDet.prepare;
    qryDet.ParamByName('IDTITULAR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;

     edPaiDetalhe.Text := qryDet.FieldByName('NOMEDEPENDENTE').AsString;
  end;
end;

procedure TfrmIndicadorRecebedor.FormShow(Sender: TObject);
begin
  inherited;
  QryTipoRecebedor.Open;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003
end;

procedure TfrmIndicadorRecebedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryTipoRecebedor.Close;
end;

procedure TfrmIndicadorRecebedor.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  rdbProprio.Checked := True;
end;

procedure TfrmIndicadorRecebedor.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if qryDet.FieldByName('IDRESPONSAVEL').AsInteger = qryDet.FieldbyName('IDPESSOA').AsInteger then begin
    { O Recebedor do dependente É o próprio dependente }
    rdbProprio.Checked           := True;
    rdbOutro.Checked             := False;
  end else begin
    { O Responsável do dependente É outra pessoa }
    rdbProprio.Checked        := False;
    rdbOutro.Checked          := True;
  end;
  dbeResponsavel.Text       := qryDet.FieldbyName('NOMERESPONSAVEL').AsString;
  dbecpfresponsavel.Text    := qryDet.FieldbyName('CPFRESPONSAVELFORMATADO').AsString; //Thiago Passos
  DbLkcTipoResponsavel.Text := qryDet.FieldByName('TIPORESPONSAVEL').AsString;
  rdbProprioClick(rdbProprio);
end;

procedure TfrmIndicadorRecebedor.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   rdbProprio.Checked := True;
   rdbProprioClick(rdbProprio);
   qryDet.FieldByname('IDTITULAR').AsString := qry.FieldByName('IDTITULAR').AsString;
   dbeResponsavel.Text                      := qryDet.FieldByName('NOMETITULAR').AsString;
   dbecpfresponsavel.Text                   := qryDet.FieldByName('CPFTITULAR').AsString; //Thiago Passos
end;

procedure TfrmIndicadorRecebedor.rdbProprioClick(Sender: TObject);
begin
  inherited;
  if rdbProprio.Checked then begin
    (* O Responsável do Dependente é o próprio dependente *)
    rdbOutro.Checked                             := False;
    QryDet.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
    QryDet.FieldByname('RESPONSAVEL').AsString   := QryDet.FieldByName('NOMETITULAR').AsString;
    dbeRecebedor.Text                            := qryDet.FieldByName('NOMETITULAR').AsString;
    dbeCpfRecebedor.Text                         := qryDet.FieldByName('CPFTITULARFORMATADO').AsString;   //Thiago Passos
  end else begin
     if Trim(dbeResponsavel.Text) = '' then begin
        MsgDlg('Indique um Responsável pelo Beneficiário.','Informação',mtInformation, [mbOk],0);
        rdbOutro.Checked                             := False;
        rdbProprio.Checked                           := True;
        QryDet.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
        Exit;
     end;
     QryDet.FieldByname('IDRESPONSAVEL').AsString := QryDet.FieldByName('IDRESPONNAOREC').AsString;
     QryDet.FieldByname('RESPONSAVEL').AsString   := QryDet.FieldByName('NOMERESPONSAVEL').AsString;
     dbeRecebedor.Text                            := qryDet.FieldByName('NOMERESPONSAVEL').AsString;
     dbecpfrecebedor.Text                         := qryDet.FieldByName('CPFRESPONSAVELFORMATADO').AsString;  //Thiago Passos
       if  qryDet.FieldByName('NOMERESPONSAVEL').AsString = '' then
         begin
           dbeRecebedor.Text                            := dbeResponsavel.Text;
           dbecpfrecebedor.Text                         := dbeCPFResponsavel.Text;  //Thiago Passos
         end;

  end;
end;

procedure TfrmIndicadorRecebedor.sbResponsavelClick(Sender: TObject);
begin
  inherited;

  MSResp.Executar;
  if MSResp.RetornouValor then begin
     QryDet.FieldByname('IDRESPONNAOREC').AsString := MSResp.ValoresChave[0];
     dbeResponsavel.Text                           := MSResp.ValoresChave[2];
     dbeCPFResponsavel.Text                        := MSResp.ValoresChave[4];  //Thiago Passos

     if rdbOutro.Checked then begin
        QryDet.FieldByname('IDRESPONNAOREC').AsString := QryDet.FieldByName('IDRESPONNAOREC').AsString;
        dbeRecebedor.Text                             := dbeResponsavel.Text;  //Thiago Passos
        dbeCpfRecebedor.Text                          := dbeCPFResponsavel.Text; //Thiago Passos

     end;
  end;
end;



procedure TfrmIndicadorRecebedor.sbNovoResponsavelClick(Sender: TObject);
begin
  inherited;
  iIdResponsavelGeral := -1;

  frmCadResponsa := TfrmCadResponsa.Create(Application);
  try
     frmCadResponsa.ShowModal;
  finally
     frmCadResponsa.Free;
  end;

  if iIdResponsavelGeral > 0 then begin
    with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iIdResponsavelGeral));
      Open;
      QryDet.FieldByname('IDRESPONNAOREC').AsString := MSResp.ValoresChave[0];
      dbeResponsavel.Text                           := MSResp.ValoresChave[2];
      dbeCPFResponsavel.Text                        := MSResp.ValoresChave[4]; //Thiago Passos
      Close;
      iIdResponsavelGeral                           := -1;
    end;
    if rdbOutro.Checked then begin
      QryDet.FieldByname('IDRESPONNAOREC').AsString := QryDet.FieldByName('IDRESPONNAOREC').AsString;
      dbeRecebedor.Text                             := dbeResponsavel.Text;
      dbeCpfRecebedor.Text                          := dbeCPFResponsavel.Text; //Thiago Passos
    end;

  end;


end;

procedure TfrmIndicadorRecebedor.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  OpDetalhe := 'I';
end;

procedure TfrmIndicadorRecebedor.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dbeResponsavel.CanFocus then dbeResponsavel.SetFocus;
  OpDetalhe := '';
end;

procedure TfrmIndicadorRecebedor.CmeCadastroConfirma(Sender: TObject);
begin
  try
   if OpDetalhe <> 'E'
     then AplicaAlteracoes([qryDet])
     else AplicaAlteracoes([qryDet]);
  except
    raise;
  end;

  Try
    If Not Sistema.GravaLogOperacoes(Self.Caption) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  OpDetalhe := '';
//  inherited;
end;



procedure TfrmIndicadorRecebedor.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  OpDetalhe := 'A';
end;



procedure TfrmIndicadorRecebedor.sbtnExcluiDetClick(Sender: TObject);
begin
 // inherited;

  OpDetalhe := 'E';
   if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
    begin
      qryDet.Edit;
      qryDet.FieldByname('IDRESPONNAOREC').AsString := '';
      qryDet.Post;
      qryDet.ApplyUpdates;
      qryDet.Close;
      qryDet.Open;
       edPaiDetalhe.Text := '';
    end;
end;



procedure TfrmIndicadorRecebedor.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  bbtnCancelarDet.Click;
end;



procedure TfrmIndicadorRecebedor.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edPaiDetalhe.Text := qryDet.FieldByName('NOMEDEPENDENTE').AsString;
end;



procedure TfrmIndicadorRecebedor.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
 CommitTransacao;
 QryDet.Close;
 QryDet.Open;
end;

end.
