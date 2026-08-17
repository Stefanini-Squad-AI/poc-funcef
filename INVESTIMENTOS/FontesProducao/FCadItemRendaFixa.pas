unit FCadItemRendaFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, StdCtrls, wwdblook, ExtCtrls, fcLabel, CmEventosCadastro,
  ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Mask,
  wwdbedit, FCadastroCS, Wwdotdot, Wwdbcomb;

type
  TfrmCadItemRendaFixa = class(TfrmCadastroCSInv)
    qryIDITEMRENFIX: TFloatField;
    qryDESCITEMRENFIX: TStringField;
    dbeDescItemRenFix: TwwDBEdit;
    Label1: TLabel;
    qryCODITEMRENFIX: TStringField;
    dbeCodigoItem: TwwDBEdit;
    Label2: TLabel;
    qryAux: TwwQuery;
    Label3: TLabel;
    dbTipoItem: TwwDBComboBox;
    qryFLGREGRA: TStringField;
    qryTIPOITEM: TStringField;
    procedure CmeCadastroBeforeConfirma(sender: TObject;var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sAcao, sOldCodigo: String;
    bValida: Boolean;
    procedure Sel(N : Longint);


  public
    { Public declarations }
  end;

var
  frmCadItemRendaFixa: TfrmCadItemRendaFixa;

implementation

{$R *.DFM}

uses uMensErro, UDataBase, uSistema, DBaseDados;

procedure TfrmCadItemRendaFixa.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('IDITEMRENFIX').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadItemRendaFixa.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if Trim(dbeDescItemRenFix.Text) = '' then
  begin
     MsgDlg('Falta a descrição do Item.', 'Warning', mtWarning, [mbOk], 0);
     if dbeDescItemRenFix.CanFocus then
        dbeDescItemRenFix.SetFocus;
     Exit;
  end;

  if Trim(dbeCodigoItem.Text) = '' then
  begin
     MsgDlg('Falta o Código do Item.', 'Warning', mtWarning, [mbOk], 0);
     if dbeCodigoItem.CanFocus then
        dbeCodigoItem.SetFocus;
     Exit;
  end;

  if qry.State = dsInsert then
  begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT * FROM ITEMRENFIX WHERE CODITEMRENFIX = ''' + Trim(dbeCodigoItem.Text) + '''');
     qryAux.Open;
     if not qryAux.IsEmpty then
     begin
        MsgDlg('O Código do Item já Existe.', 'Warning', mtWarning, [mbOk], 0);
        if dbeCodigoItem.CanFocus then
           dbeCodigoItem.SetFocus;
        Exit;
     end;
  end
  else
  begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT * FROM ITEMRENFIX WHERE CODITEMRENFIX = ''' + Trim(dbeCodigoItem.Text) + ''' ' +
                    'AND IDITEMRENFIX <> ''' + qryIDITEMRENFIX.AsString + '''');
     qryAux.Open;
     if not qryAux.IsEmpty then
     begin
        MsgDlg('O Código do Item já Existe.', 'Warning', mtWarning, [mbOk], 0);
        if dbeCodigoItem.CanFocus then
           dbeCodigoItem.SetFocus;
        Exit;
     end;
  end;

  Accept := True;
  bValida := True;
  if qry.State = dsInsert then
     qryIDITEMRENFIX.AsInteger := LeUltRegistro(nil, 'ITEMRENFIX');

end;

procedure TfrmCadItemRendaFixa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadItemRendaFixa.FormCreate(Sender: TObject);
begin
  inherited;
   Sel(-1);
end;

procedure TfrmCadItemRendaFixa.sbtnInserirClick(Sender: TObject);
begin
   sAcao := 'I';
   sOldCodigo := '';
   inherited;
   if dbeCodigoItem.CanFocus then
      dbeCodigoItem.SetFocus;
end;

procedure TfrmCadItemRendaFixa.sbtnAlterarClick(Sender: TObject);
begin
   sAcao := 'A';
   sOldCodigo := dbeCodigoItem.Text;
   inherited;
   if dbeCodigoItem.CanFocus then
      dbeCodigoItem.SetFocus;
end;

procedure TfrmCadItemRendaFixa.bbtnConfirmarClick(Sender: TObject);
var sGrpArquivo, sCodAnt: String;
    sCodigo, sDescricao: String;
    bExisteOld, bExisteNew: Boolean;
begin
   try
      bExisteOld := False;
      bExisteNew := False;
      sCodigo := Trim(dbeCodigoItem.Text);
      sDescricao := Trim(dbeDescItemRenFix.Text);
      sCodAnt := sAcao;
      bValida := False;

      inherited;

      if not bValida then
         Exit;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT * FROM CMPBD WHERE IDCAMPO = ''INV_' + Copy(sOldCodigo,1,8)+ '''');
      qryAux.Open;
      if not qryAux.IsEmpty then
         bExisteOld := True;

      sAcao := sCodAnt;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT * FROM CMPBD WHERE IDCAMPO = ''INV_' + Copy(sCodigo,1,8)+ '''');
      qryAux.Open;
      if not qryAux.IsEmpty then
         bExisteNew := True;

      if not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      if (bExisteOld) and (sCodigo <> sOldCodigo) then
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM CMPBDGRP WHERE IDCAMPO = ''INV_' + Copy(sOldCodigo,1,8)+ '''');
         qryAux.ExecSQL;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM CMPBD WHERE IDCAMPO = ''INV_' + Copy(sOldCodigo,1,8)+ '''');
         qryAux.ExecSQL;
      end;

      if sAcao = 'I' then
      begin
         if bExisteNew then
            sAcao := 'A';
      end
      else
      if sAcao = 'A' then
      begin
         if not bExisteNew then
            sAcao := 'I';
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT CODGRUPOARQUIVO FROM GRPARQUIVO ' +
                     'WHERE UPPER(DESCGRUPOARQUIVO) = ''INVESTIMENTO''');
      qryAux.Open;
      if qryAux.IsEmpty then
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('INSERT INTO GRPARQUIVO (CODGRUPOARQUIVO, DESCGRUPOARQUIVO) ' +
                        'VALUES (''INVEST'', ''INVESTIMENTO'')');
         qryAux.Prepare;
         qryAux.ExecSQL;
         sGrpArquivo := 'INVEST';
      end
      else
         sGrpArquivo := qryAux.FieldByName('CODGRUPOARQUIVO').AsString;

      if sAcao = 'I' then
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('INSERT INTO CMPBD ' +
                        '   (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) ' +
                        'VALUES ' +
                        '   (''INV_' + Copy(sCodigo,1,8) + ''', ''DUAL'', ' +
                        '    ''' + sCodigo + ''', ''' + sDescricao + ''', 2, 1)');
         qryAux.Prepare;
         qryAux.ExecSQL;

         qryAux.SQL.Clear;
         qryAux.SQL.Add('INSERT INTO CMPBDGRP ' +
                        '   (CODGRUPOARQUIVO, IDCAMPO) ' +
                        'VALUES ' +
                        '   (''' + sGrpArquivo + ''', ''INV_' + Copy(sCodigo,1,8) + ''')');
         qryAux.Prepare;
         qryAux.ExecSQL;
      end
      else if sAcao = 'A' then
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('UPDATE CMPBD ' +
                        'SET IDCAMPO = ''INV_' + Copy(sCodigo,1,8) + ''', ' +
                        '    ENTIDADE = ''DUAL'',' +
                        '    NOMEDOCAMPO = ''' + sCodigo + ''', ' +
                        '    DESCRICAODOCAMPO = ''' + sDescricao + ''',' +
                        '    CAMPODOBANCO = 2, IDTIPODADO = 1 ' +
                        'WHERE IDCAMPO = ''INV_' + Copy(Trim(sOldCodigo),1,8) + '''');
         qryAux.Prepare;
         qryAux.ExecSQL;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT * FROM CMPBDGRP ' +
                        'WHERE IDCAMPO = ''INV_' + Copy(Trim(sOldCodigo),1,8) + ''' AND ' +
                        '      CODGRUPOARQUIVO = ''' + sGrpArquivo + '''');
         qryAux.Open;
         if qryAux.IsEmpty then
         begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('INSERT INTO CMPBDGRP ' +
                           '   (CODGRUPOARQUIVO, IDCAMPO) ' +
                           'VALUES ' +
                           '   (''' + sGrpArquivo + ''', ''INV_' + Copy(sCodigo,1,8) + ''')');
            qryAux.Prepare;
            qryAux.ExecSQL;
         end else
         begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CMPBDGRP ' +
                           'SET IDCAMPO = ''INV_' + Copy(sCodigo,1,8) + '''' +
                           'WHERE IDCAMPO = ''INV_' + Copy(Trim(sOldCodigo),1,8) + ''' AND ' +
                           '      CODGRUPOARQUIVO = ''' + sGrpArquivo + '''');
            qryAux.Prepare;
            qryAux.ExecSQL;
         end;
      end;
      if dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Commit;
   except
      if dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Rollback;
      if qry.State = dsInsert then
      begin
         bbtnCancelar.Click;
         CmeCadastro.Delete(Self);
      end;
   end;

end;

procedure TfrmCadItemRendaFixa.sbtnApagarClick(Sender: TObject);
begin
   sAcao := 'E';
   sOldCodigo := '';
   inherited;
end;

procedure TfrmCadItemRendaFixa.FormShow(Sender: TObject);
begin
  inherited;
  sOldCodigo := '';
  if Pos('.CM',Sistema.NomeUsuario) < 0 then
     MontaSelect.Filtro.Add('IDITEMRENFIX > 0');
  Sel(0);
end;

end.
