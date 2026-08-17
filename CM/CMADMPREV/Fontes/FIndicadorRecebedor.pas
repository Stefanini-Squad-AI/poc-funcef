
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------------------------
// Autor(a)    : William Santana
// SOL         : 161550
// Kintana     : 1717512
// Data        : 20/07/2014
// Alteração   : Implantar flag para marcação da informação "Curatela Extinta".
//               Essa opção deverá constar na tela de cadastro de data inicio e data fim de curatela.
//------------------------------------------------------------------------------
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
    Label2: TLabel;
    dbeCpfRecebedor: TDBEdit;
    Label4: TLabel;
    DBText1: TDBText;
    qryRepAtivo: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure bbtnOkDetClick(Sender: TObject);
  private
    { Private declarations }
    sFiltroBenef ,
    OpDetalhe        : String;
    bNaoValidaRepr : boolean; // edilaine Sol 161550 KIN 1717512


  public
    { Public declarations }
     procedure IntegraBenef_ReprLegal(acao: integer); //William Santana Sol 161550 KIN 1717512
  end;

var
  frmIndicadorRecebedor: TfrmIndicadorRecebedor;

implementation

uses {FPrincipal,} UAdmPrev, UMensErro, UDataBase, UCalcDV, FTelaAut, DBaseDados, FCadResponsa,
  UBeneficio, fAguarde, DAPrev, Usistema,
  FCadElegivel; //William Santana - SOL 161550 KIN 1717512

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

  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003
end;

procedure TfrmIndicadorRecebedor.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  rdbProprio.Checked := True;
end;

procedure TfrmIndicadorRecebedor.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  bNaoValidaRepr := true; // edilaine Sol 161550 KIN 1717512
  if qryDet.FieldByName('IDRESPONSAVEL').AsInteger = qryDet.FieldbyName('IDPESSOA').AsInteger then begin
    { O Recebedor do dependente É o próprio dependente }
    rdbProprio.Checked           := True;
    rdbOutro.Checked             := False;
  end else begin
    bNaoValidaRepr := false; // edilaine Sol 161550 KIN 1717512
    { O Responsável do dependente É outra pessoa }
    rdbProprio.Checked        := False;
    rdbOutro.Checked          := True;
  end;
  //Início - William Santana - SOL 161550 KIN 1717512
  //dbeResponsavel.Text       := qryDet.FieldbyName('NOMERESPONSAVEL').AsString;
  //dbecpfresponsavel.Text    := qryDet.FieldbyName('CPFRESPONSAVELFORMATADO').AsString; //Thiago Passos
  //DbLkcTipoResponsavel.Text := qryDet.FieldByName('TIPORESPONSAVEL').AsString;
  //rdbProprioClick(rdbProprio);
  //Término - William Santana - SOL 161550 KIN 1717512
end;

procedure TfrmIndicadorRecebedor.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   rdbProprio.Checked := True;
   rdbProprioClick(rdbProprio);
   qryDet.FieldByname('IDTITULAR').AsString := qry.FieldByName('IDTITULAR').AsString;
  // Início - William Santana - SOL 161550 KIN 1717512
  // dbeResponsavel.Text                      := qryDet.FieldByName('NOMETITULAR').AsString;
  // dbecpfresponsavel.Text                   := qryDet.FieldByName('CPFTITULAR').AsString; //Thiago Passos
  // Término - William Santana - SOL 161550 KIN 1717512
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
    // Início - William Santana - SOL 161550 KIN 1717512
    QryDet.FieldByname('DATAFIMRECEB').Clear;
  end else begin
       qryRepAtivo.close;
       qryRepAtivo.ParamByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
       qryRepAtivo.Open;

       if (bNaoValidaRepr) AND (qryRepAtivo.isEmpty) then
       begin
          MsgDlg('É necessário o cadastro de um representante legal para o participante selecionado.','Informação',mtWarning, [mbOk],0);
          IntegraBenef_ReprLegal(1);
       end
       else
       begin

        QryDet.FieldByname('IDRESPONSAVEL').AsString := qryRepAtivo.FieldByName('IDRESPONSAVEL').AsString;
        QryDet.FieldByname('RESPONSAVEL').AsString   := qryRepAtivo.FieldByName('NOMERESPONSAVEL').AsString;
        dbeRecebedor.Text                            := qryRepAtivo.FieldByName('NOMERESPONSAVEL').AsString;
        dbecpfrecebedor.Text                         := qryRepAtivo.FieldByName('CPFFORMATADO').AsString;

        QryDet.FieldByname('IDRESPONNAOREC').AsString          := qryRepAtivo.FieldByName('IDRESPONSAVEL').AsString;
        QryDet.FieldByname('DATAFIMRECEB').AsString            := qryRepAtivo.FieldByname('DATATERMINO').AsString;
        QryDet.FieldByname('CPFRECEBEDORFORMATADO').AsString   := qryRepAtivo.FieldByName('CPFFORMATADO').AsString;
        QryDet.FieldByname('CPFRESPONSAVELFORMATADO').AsString := qryRepAtivo.FieldByName('CPFFORMATADO').AsString;

     {if Trim(dbeResponsavel.Text) = '' then begin
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
         end;}

       if not bNaoValidaRepr then
          bNaoValidaRepr := true;

     end;
    // Término - William Santana - SOL 161550 KIN 1717512
  end;
end;

procedure TfrmIndicadorRecebedor.sbResponsavelClick(Sender: TObject);
begin
  inherited;

  MSResp.Executar;
  if MSResp.RetornouValor then begin
     QryDet.FieldByname('IDRESPONNAOREC').AsString := MSResp.ValoresChave[0];

     // Início - William Santana - SOL 161550 KIN 1717512
//     dbeResponsavel.Text                           := MSResp.ValoresChave[2];
//     dbeCPFResponsavel.Text                        := MSResp.ValoresChave[4];  //Thiago Passos
//
//     if rdbOutro.Checked then begin
//        QryDet.FieldByname('IDRESPONNAOREC').AsString := QryDet.FieldByName('IDRESPONNAOREC').AsString;
//        dbeRecebedor.Text                             := dbeResponsavel.Text;  //Thiago Passos
//        dbeCpfRecebedor.Text                          := dbeCPFResponsavel.Text; //Thiago Passos
//
//     end;
     // Início - William Santana - SOL 161550 KIN 1717512
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
      //Início - William Santana - SOL 161550 KIN 1717512
      //dbeResponsavel.Text                           := MSResp.ValoresChave[2];
      //dbeCPFResponsavel.Text                        := MSResp.ValoresChave[4]; //Thiago Passos
      //Término - William Santana - SOL 161550 KIN 1717512
      Close;
      iIdResponsavelGeral                           := -1;
    end;
    if rdbOutro.Checked then begin
      QryDet.FieldByname('IDRESPONNAOREC').AsString := QryDet.FieldByName('IDRESPONNAOREC').AsString;
      //Início - William Santana - SOL 161550 KIN 1717512
//      dbeRecebedor.Text                             := dbeResponsavel.Text;
//      dbeCpfRecebedor.Text                          := dbeCPFResponsavel.Text; //Thiago Passos
      //Término - William Santana - SOL 161550 KIN 1717512
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
  // Início - William Santana - SOL 161550 KIN 1717512
  //if dbeResponsavel.CanFocus then dbeResponsavel.SetFocus;   
  // Término - William Santana - SOL 161550 KIN 1717512
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

//Início - William Santana SOl 161550 KIN 1717512
procedure TfrmIndicadorRecebedor.IntegraBenef_ReprLegal(acao: integer);
begin
 // acao =
 // 1 - abre Cadastro de Elegivel e Participante
 // 2 - preenche dados (após gravar Representante Legal na tela de Elegével e Participante)


  if (acao = 1) then
  begin

    AbrirForm(frmCadElegivel, TfrmCadElegivel, True);
    frmCadElegivel.abreCadElegeivel_ReprLegal(qryDet.FieldbyName('IDPESSOA').AsInteger,
                                 qryDet.FieldbyName('IDPESSOA').AsInteger,
                                 qryDet.FieldbyName('IDPESSJUR').AsInteger);

  end
  else
  if (acao = 2) then
  begin
    if frmCadElegivel <> nil then
       frmCadElegivel.bbtnSairClick(frmCadElegivel.bbtnSair);

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL := qrydet.sql;
    qryAux.SQL.Add (' AND BTP.IDPESSOA = :IDPESSOA ' ) ;
    qryAux.ParamByName('IDPESSOA').AsString  := QryDet.FieldByName('IDPESSOA').AsString;
    qryAux.ParamByName('IDTITULAR').AsString := QryDet.FieldByName('IDTITULAR').AsString;
    qryAux.open;

    QryDet.FieldByName('IDRESPONNAOREC').AsString          := qryAux.FieldByName('IDRESPONNAOREC').AsString;
    QryDet.FieldByName('NOMERESPONSAVEL').AsString         := qryAux.FieldByName('NOMERESPONSAVEL').AsString ;
    QryDet.FieldByName('CPFRESPONSAVELFORMATADO').AsString := qryAux.FieldByName('CPFRESPONSAVELFORMATADO').AsString ;
    QryDet.FieldByname('IDRESPONSAVEL').AsString           := qryAux.FieldByname('IDRESPONSAVEL').AsString;
    QryDet.FieldByname('RESPONSAVEL').AsString             := qryAux.FieldByname('RESPONSAVEL').AsString ;

    rdbProprioClick(self);

  end;

end;


procedure TfrmIndicadorRecebedor.bbtnOkDetClick(Sender: TObject);
 var
    bExisteVigente : Boolean;
begin
  inherited;
        bExisteVigente := True;

         Qryaux.close;
         Qryaux.sql.clear;
         Qryaux.SQL.Add(' SELECT IDRESPONSAVEL, SITATUAL FROM HSTREPRLEGAL WHERE IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString );
         Qryaux.SQL.Add(' AND SITATUAL = 1 ');
         Qryaux.Open;

        bExisteVigente :=  not(Qryaux.isempty);


     if (not bExisteVigente) and (rdbOutro.Checked) then
     begin
       rdbProprioClick(rdbOutro);
       exit;
     end;


     if (bExisteVigente) and (rdbOutro.Checked) then
     begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
        qryAux.SQL.Add(' CODTIPORECEBEDOR = '+Quotedstr(qryDet.FieldByname('CODTIPORECEBEDOR').AsString) );
        qryAux.SQL.Add(', IDRESPONNAOREC =  '+Quotedstr(qryDet.FieldByname('IDRESPONSAVEL').AsString) );
        qryAux.SQL.Add(', IDRESPONSAVEL = '+Quotedstr(qryDet.FieldByName('IDRESPONSAVEL').AsString) );

        qryAux.SQL.Add(', DATAFIMRECEB =    '+Quotedstr(qryDet.FieldByname('DATAFIMRECEB').AsString) );
        qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr(qryDet.FieldByName('IDPESSJUR').AsString)    );
        qryAux.SQL.Add(' AND IDPESSOA =     '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
        qryAux.SQL.Add(' AND IDTITULAR =    '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );

        // Atualiza menos os que já foram encerrados
        qryAux.SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
        qryAux.SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
        qryAux.SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
        qryAux.SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
        qryAux.SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
        qryAux.SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
        qryAux.SQL.Add('                    AND B.IDTITULAR = '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );
        qryAux.SQL.Add('                    AND B.IDPESSOA  = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
        qryAux.SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');
        qryAux.ExecSQL;

        // atualizando o recebedor para responsavel
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE HSTREPRLEGAL set ');
        qryAux.SQL.Add('        IDRECEBEDOR = '+Quotedstr(qryDet.FieldByname('IDRESPONSAVEL').AsString));
        qryAux.SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( qry.FieldByName('IDPESSJUR').AsString)    );
        qryAux.SQL.Add('   AND IDPESSOA  = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)  );
        qryAux.SQL.Add('   AND IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
        qryAux.SQL.Add('   AND SITATUAL = 1');
        qryAux.ExecSQL;

     end;

    if (rdbProprio.Checked) then
    begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
        qryAux.SQL.Add(' CODTIPORECEBEDOR = '+Quotedstr(qryDet.FieldByname('CODTIPORECEBEDOR').AsString) );
        qryAux.SQL.Add(', IDRESPONNAOREC = null ' );
        qryAux.SQL.Add(', IDRESPONSAVEL = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString) );

        qryAux.SQL.Add(', DATAFIMRECEB =    '+Quotedstr(qryDet.FieldByname('DATAFIMRECEB').AsString) );
        qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr(qryDet.FieldByName('IDPESSJUR').AsString)    );
        qryAux.SQL.Add(' AND IDPESSOA =     '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
        qryAux.SQL.Add(' AND IDTITULAR =    '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );

        // Atualiza menos os que já foram encerrados
        qryAux.SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
        qryAux.SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
        qryAux.SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
        qryAux.SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
        qryAux.SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
        qryAux.SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
        qryAux.SQL.Add('                    AND B.IDTITULAR = '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );
        qryAux.SQL.Add('                    AND B.IDPESSOA  = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
        qryAux.SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');
        qryAux.ExecSQL;

        // atualizando o recebedor para o proprio
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE HSTREPRLEGAL set ');
        qryAux.SQL.Add('        IDRECEBEDOR = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString));
        qryAux.SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( qry.FieldByName('IDPESSJUR').AsString)    );
        qryAux.SQL.Add('   AND IDPESSOA  = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)  );
        qryAux.SQL.Add('   AND IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
        qryAux.SQL.Add('   AND SITATUAL = 1');
        qryAux.ExecSQL;

    end;

    qryDet.Close;
    if not qryDep.Prepared then qryDet.prepare;
    qryDet.ParamByName('IDTITULAR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;

end;
//Término - William Santana SOl 161550 KIN 1717512


end.
