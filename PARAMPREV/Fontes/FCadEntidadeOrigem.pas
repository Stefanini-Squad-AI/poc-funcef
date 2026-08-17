// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)   : Felipe Azevedo dos Santos
// Data       : 06/03/2013
// Pendência  : SOL 185758 KTN 1743062
// Descricao  : Criação da funcionalidade.
//------------------------------------------------------------------------------

unit FCadEntidadeOrigem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, UMensErro,FTelaAut
  ,uCMTypes, dBaseDados;

type
  TfrmCadEntidadeOrigem = class(TfrmCadastroCS)
    lblEntidadeOrigem: TLabel;
    lblCnpj: TLabel;
    lblcnpb: TLabel;
    edtEntidadeOrigem: TDBEdit;
    edtCnpj: TMaskEdit;
    edtcnpb: TDBEdit;
    rdgTipo: TDBRadioGroup;
    qryAux: TwwQuery;
    qryCNPJ: TwwQuery;
    qryIDENTIDADEORIGEM: TFloatField;
    qryNOME: TStringField;
    qryCNPJ2: TStringField;
    qryTIPO: TStringField;
    qryCNPBSUSEP: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edtCnpjExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure edtCnpjChange(Sender: TObject);
    procedure edtcnpbKeyPress(Sender: TObject; var Key: Char);
  private
    FExeVerificaCNPJ : boolean;

    function VerificaCNPB : boolean;
    function ValidaCampos : boolean;
    procedure VerificaCNPJ;
    function VerificaPortabilidade : boolean;
    procedure Excluir;
    procedure LimparCampos;
    { Private declarations }
  public
    property ExeVerificaCNPJ : boolean read FExeVerificaCNPJ write FExeVerificaCNPJ;
    { Public declarations }
  end;

var
  frmCadEntidadeOrigem: TfrmCadEntidadeOrigem;
implementation

uses FEscolheEntidadeOrigem;

{$R *.DFM}

procedure TfrmCadEntidadeOrigem.bbtnConfirmarClick(Sender: TObject);
begin
  // valida se os campos estão preenchidos
  if (ValidaCampos) then
  begin
      // verificação se ja existe o cnpj para o cnbp
      if (VerificaCNPB) then
      begin
          qry.FieldByName('CNPJ').AsString := Trim(edtCnpj.Text);
          // Grava o registro
          inherited;

          if (qry.State in [dsInsert]) then
          begin
              LimparCampos;
              sbtnAlterar.Enabled := False;
              sbtnApagar.Enabled := False;
              ExeVerificaCNPJ := False;
              bbtnCancelarClick(Self);
          end;

          MsgDlg('Dados gravados com sucesso','Informação',mtInformation,[mbOk],0);

      end;
  end;
end;

procedure TfrmCadEntidadeOrigem.sbtnProcurarClick(Sender: TObject);
begin

 // verifica se tem resultados antigos, se tiver limpa os mesmos
  if (MontaSelect.RetornouValor) then
    MontaSelect.Cancela;

  inherited;
  
  if (MontaSelect.RetornouValor) then
  begin

       edtEntidadeOrigem.Text := MontaSelect.ValoresChave[0];
       edtCnpj.Text := MontaSelect.ValoresChave[1];
       rdgTipo.Value := MontaSelect.ValoresChave[2];
       edtcnpb.Text := MontaSelect.ValoresChave[3];

       qry.ParamByName('IDENTIDADEORIGEM').AsString := MontaSelect.ValoresChave[4];
       qry.Open;

       sbtnAlterar.Enabled := True;
       sbtnApagar.Enabled := True;
  end
  else
  begin
       if(qry.IsEmpty) then
       begin
           sbtnAlterar.Enabled := False;
           sbtnApagar.Enabled := False;
       end;
  end;
end;

procedure TfrmCadEntidadeOrigem.sbtnInserirClick(Sender: TObject);
begin
  qry.Open;

  inherited;

  LimparCampos;
  edtEntidadeOrigem.SetFocus;
end;

procedure TfrmCadEntidadeOrigem.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCampos;

  qry.Close;

  sbtnAlterar.Enabled := False;
  sbtnApagar.Enabled := False;

  ExeVerificaCNPJ := False;
end;

function TfrmCadEntidadeOrigem.VerificaCNPB: boolean;
begin
     // verifica se já existe um cnbp para aquele determinado cnpj
     Result := False;


     if (qry.State in [dsInsert, dsEdit]) then
     begin
       qryAux.SQL.Clear;
       qryAux.SQL.Add('SELECT CNPBSUSEP FROM CM.ENTIDADEORIGEM ' +
                      'WHERE CNPBSUSEP = :CNPBSUSEP ' +
                      'AND CNPJ = :CNPJ ');
       qryAux.ParamByName('CNPBSUSEP').AsString := Trim(edtcnpb.Text);
       qryAux.ParamByName('CNPJ').AsString := Trim(edtCnpj.Text);
       qryAux.Open;

           if ((qryAux.IsEmpty) and (qry.State in [dsInsert])) then
           begin
              Result := True;
           end
           else
           begin
               // caso seja alteração
               if (qry.State in [dsEdit]) then
               begin
                  // se a qry for vazia então retorna true
                  if (qryAux.IsEmpty) then
                  begin
                       Result := True;
                       Exit;
                  end
                  // não mudou o CNPB
                  else if (qry.FieldByName('CNPBSUSEP').NewValue = qry.FieldByName('CNPBSUSEP').OldValue) then
                  begin
                     Result := True;
                     Exit;
                  end
                  // se achou um cnpj já cadastrado com o mesmo cnpb retorna false
                  else if not(qryAux.IsEmpty) then
                  begin
                       if (qryAux.Fields[0].AsString = qry.FieldByName('CNPBSUSEP').AsString) then
                       begin
                          Result := False;
                       end
                       else
                       begin
                          Result := True;
                          Exit;
                       end;
                  end;
               end;
               MsgDlg('Esse CNPJ já está cadastrado para esse CNPB/SUSEP',
                      'Informação',mtInformation, [mbOk],0);
               edtcnpb.SetFocus;
           end;
     end
     else
     begin
          Result := True;
     end;

end;

function TfrmCadEntidadeOrigem.ValidaCampos: boolean;
begin
     Result := False;

     if (Trim(edtEntidadeOrigem.Text) = '') then
     begin
          MsgDlg('O campo Nome é de preenchimento obrigatório',
                 'Informação',mtInformation,[MbOk], 0);
          edtEntidadeOrigem.SetFocus;
          Exit;
     end
     else if (Trim(edtCnpj.Text) = '') then
     begin
          MsgDlg('O campo CNPJ é de preenchimento obrigatório',
                 'Informação',mtInformation,[MbOk], 0);
          edtCnpj.SetFocus;
          Exit;
     end
     else if (Trim(edtcnpb.Text) = '') then
     begin
          MsgDlg('O campo CNPB/SUSEP é de preenchimento obrigatório',
                 'Informação',mtInformation,[MbOk], 0);
          edtcnpb.SetFocus;
          Exit;
     end
     else if (rdgTipo.ItemIndex = -1) then
     begin
          MsgDlg('O campo Tipo é de preenchimento obrigatório',
                 'Informação',mtInformation,[MbOk], 0);
          rdgTipo.ItemIndex := 0;
          rdgTipo.SetFocus;
          Exit;
     end
     else
     begin
          Result := True;
     end;
end;

procedure TfrmCadEntidadeOrigem.VerificaCNPJ;
begin
     // verifica se o cnpj ja existe
     if (qry.State in [dsInsert]) then
     begin
          qryCNPJ.SQL.Clear;
          qryCNPJ.SQL.Add('SELECT * FROM CM.ENTIDADEORIGEM WHERE CNPJ = :CNPJ');
          qryCNPJ.ParamByName('CNPJ').AsString := Trim(edtCnpj.Text);
          qryCNPJ.Open;

           if not(qryCNPJ.IsEmpty) then
           begin
                // chama o form de escolher entidade
              ExeVerificaCNPJ := True;
              AbrirFormModal(frmEscolheEntidadeOrigem, TfrmEscolheEntidadeOrigem);
           end;
      end;

end;

procedure TfrmCadEntidadeOrigem.edtCnpjExit(Sender: TObject);
begin
  inherited;
  // verifica se ja foi executado a rotina VerificaCNPJ
  if not(ExeVerificaCNPJ) then
  begin
  if (Trim(edtCnpj.Text) <> '') then
     VerificaCNPJ;
  end;
end;

function TfrmCadEntidadeOrigem.VerificaPortabilidade: boolean;
begin
     Result := False;

     // verifica se a entidade de origem está vinculada com alguma portabilidade
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT IDENTIDADEORIGEM FROM CM.PORTABILIDADEPREV ' +
                    'WHERE IDENTIDADEORIGEM = :IDENTIDADEORIGEM');
     qryAux.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[4]);
     qryAux.Open;

     // se retornar vazio é que não tem entidade relacionada com portabilidade
     if (qryAux.IsEmpty) then
        Result := True;

     qryAux.Close;
end;

procedure TfrmCadEntidadeOrigem.sbtnApagarClick(Sender: TObject);
begin

if (MsgDlg('Confirma exclusão dos dados da entidade de origem.','Confirmação',
   mtConfirmation,[mbYes, mbNo], 0) = mrYes ) then
   // verifica se a entidade está vinculada há alguma portabilidade
   if (VerificaPortabilidade) then
   begin
      Excluir;
      LimparCampos;
      bbtnCancelarClick(self);
    //inherited;
   end
   else
   begin
     MsgDlg('Exclusão não permitida. Esta Entidade de Origem está vinculada a uma portabilidade',
            'Informação', mtInformation, [mbOk], 0);
   end;


end;

procedure TfrmCadEntidadeOrigem.Excluir;
begin
     try
       if not(dtmBaseDados.dbBaseDados.InTransaction) then
          dtmBaseDados.dbBaseDados.StartTransaction;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('DELETE FROM CM.ENTIDADEORIGEM ' +
                    'WHERE IDENTIDADEORIGEM = :IDENTIDADEORIGEM');
        qryAux.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[4]);
        qryAux.ExecSQL;

        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Commit;

        Qry.Close;
        Qry.Open;
      except
          if dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.Rollback;
          sbtnApagar.Down := False;
          Qry.DisableControls;
          Qry.Close;
          Qry.Open;
          Qry.EnableControls;
       end;
end;

procedure TfrmCadEntidadeOrigem.LimparCampos;
begin
   edtEntidadeOrigem.Clear;
   edtCnpj.Clear;
   edtcnpb.Clear;
   rdgTipo.ItemIndex := -1;
end;

procedure TfrmCadEntidadeOrigem.edtCnpjChange(Sender: TObject);
begin
  inherited;
  ExeVerificaCNPJ := False;
end;

procedure TfrmCadEntidadeOrigem.edtcnpbKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not(Key in ['0' .. '9', #8]) then
     Key := #0;
end;

end.
