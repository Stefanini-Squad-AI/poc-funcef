unit FVerificaMenuSAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Menus, fcLabel, ppMemo, ppBands,
  ppReport, ppSubRpt, ppStrtch, ppRegion, ppPrnabl, ppClass, ppCtrls,
  ppCache, ppComm, ppRelatv, ppProd, ppDB, ppDBPipe, ppDBBDE;

type
  TfrmVerificaMenuSAD = class(TfrmOkCancelar)
    qryModulo: TwwQuery;
    qryMenu: TwwQuery;
    pgCtrlVerificaMenu: TPageControl;
    tbsResultado: TTabSheet;
    memResult: TMemo;
    qryBanco: TwwQuery;
    pnlDados: TPanel;
    lbNomDescricao: TfcLabel;
    lblModulo: TfcLabel;
    rptRelatorio: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    qryRelatorio: TwwQuery;
    btImprimir: TBitBtn;
    qryRelatorioNOMEFUNCAO: TStringField;
    updRelatorio: TUpdateSQL;
    pplRelatorio: TppBDEPipeline;
    dsRelatorio: TwwDataSource;
    ppLine1: TppLine;
    qryRelatorioTIPO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    qryRelatorioITEMMENU: TStringField;
    ppDBText3: TppDBText;
    ppLine2: TppLine;
    lblCaption: TppLabel;
    lblItem: TppLabel;
    qryObjeto: TwwQuery;
    qryObjetoFUNCAOPAI: TStringField;
    qryObjetoFUNCAO: TStringField;
    qryObjetoOBJETO: TStringField;
    qryObjetoIDOBJETO: TFloatField;
    qryObjetoIDFUNCAO: TFloatField;
    qryMenuIDFUNCAO: TFloatField;
    qryMenuNOMEFUNCAO: TStringField;
    qryBancoFUNCAOPAI: TStringField;
    qryBancoOBJETO: TStringField;
    qryBancoIDOBJETO: TFloatField;
    qryBancoIDFUNCAO: TFloatField;
    qryBancoFUNCAO: TStringField;
    qryRelatorioFUNCAOPAI: TStringField;
    qryRelatorioTEMITEM: TStringField;
    lblFuncaoPai: TppLabel;
    ppDBText4: TppDBText;
    lblCadastrado: TppLabel;
    ppDBText5: TppDBText;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravaItem(sCaption, sHist, sNomeItem, sItemPai, sTemItem: String);
    function CaptaCaption(sString: String): String;
  public
    { Public declarations }
  end;

var
  frmVerificaMenuSAD: TfrmVerificaMenuSAD;

implementation

uses FPrincipal, USistema, UMensErro;

{$R *.DFM}

procedure TfrmVerificaMenuSAD.FormShow(Sender: TObject);
begin
  inherited;
  lblModulo.Caption := Sistema.NomeModulo;
  memResult.Lines.Clear;
end;

procedure TfrmVerificaMenuSAD.bbtnConfirmarClick(Sender: TObject);
var i, j, k, l, m, n: word;
    bAlgumaInconsist, bEncontrou: boolean;
    sNomeBanco, sNomeMenu, sNomeItem, sTemItem, sHist: string;
    SubMenu, SubMenu2, SubMenu3, SubMenu4: TMenuItem;
begin
  inherited;
  qryRelatorio.Close;
  qryRelatorio.Open;

  memResult.Lines.Clear;
  memResult.Lines.Add('Inconsistências Encontradas : ');
  memResult.Lines.Add(' ');
  memResult.Lines.Add('1. Existe no Sistema e NÃO existe no Banco de Dados ');
  memResult.Lines.Add(' ');
  memResult.Lines.Add('Caption do Menu            Função Pai               Item de Menu                      Cadastrado');
  memResult.Lines.Add('----------------------------------- ------------------------------ ---------------------------------------- ----------------');
  sHist := 'Existe no Banco mas NÂO tem no Sistema';

  bAlgumaInconsist := False;
  with frmPrincipal do
  begin
     for i := 0 to mnu.Items.Count - 1 do
     begin
          SubMenu := mnu.Items[i];
          for j := 0 to SubMenu.Count - 1 do
          begin
             if not SubMenu.Items[j].Visible then
                continue;

             sNomeMenu := CaptaCaption(SubMenu.Items[j].Caption);
             sNomeItem := SubMenu.Items[j].Name;

             // Se for um dos menus do padrão, não considera
             if Pos('_Padrao',SubMenu.Items[j].Name) > 0 then
                sNomeMenu := '';

             if (sNomeMenu = '') or (sNomeMenu = '-') then
                continue;

             qryMenu.Close;
             qryMenu.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
             qryMenu.ParamByName('NOMEFUNCAO').AsString := sNomeMenu;
             qryMenu.Open;

             if qryMenu.IsEmpty then
             begin
                bAlgumaInconsist := True;
                with qryObjeto do
                begin
                   Close;
                   ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
                   ParamByName('NOMEOBJETO').AsString := sNomeItem;
                   Open;
                   if not IsEmpty then
                      sTemItem := 'S'
                   else
                      sTemItem := 'N';
                end;
                memResult.Lines.Add(Copy(sNomeMenu + '                         ',1,25) +
                                    Copy(qryObjetoFUNCAOPAI.AsString + '                         ',1,25) +
                                    Copy(sNomeItem + '                         ', 1, 25) +
                                    '         ' + sTemItem);
                GravaItem(sNomeMenu, sHist, sNomeItem, qryObjetoFUNCAOPAI.AsString, sTemItem);
             end;

             // Verificar se SubMenu possui "filho", ou seja, outro submenu
             if SubMenu.Items[j].Count > 0 then
             begin
                SubMenu2 := SubMenu.Items[j];

                for k := 0 to SubMenu2.Count - 1 do
                begin
                   sNomeMenu := CaptaCaption(SubMenu2.Items[k].Caption);
                   sNomeItem := SubMenu2.Items[k].Name;

                   // Se for um dos menus do padrão, não considera
                   if Pos('Portuguese',SubMenu2.Items[k].Name) > 0 then
                      sNomeMenu := '';

                   if (sNomeMenu = '') or (sNomeMenu = '-') then
                      continue;

                   qryMenu.Close;
                   qryMenu.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
                   qryMenu.ParamByName('NOMEFUNCAO').AsString := sNomeMenu;
                   qryMenu.Open;

                   if qryMenu.IsEmpty then
                   begin
                      bAlgumaInconsist := True;
                      with qryObjeto do
                      begin
                         Close;
                         ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
                         ParamByName('NOMEOBJETO').AsString := sNomeItem;
                         Open;
                         if not IsEmpty then
                            sTemItem := 'S'
                         else
                            sTemItem := 'N';
                      end;
                      memResult.Lines.Add(Copy(sNomeMenu + '                         ',1,25) +
                                          Copy(qryObjetoFUNCAOPAI.AsString + '                         ',1,25) +
                                          Copy(sNomeItem + '                         ', 1, 25) +
                                          '         ' + sTemItem);
                      GravaItem(sNomeMenu, sHist, sNomeItem, qryObjetoFUNCAOPAI.AsString, sTemItem);
                   end;

                   // Verificar se SubMenu possui "neto", ou seja, outro submenu
                   if SubMenu2.Items[k].Count > 0 then
                   begin
                      SubMenu4 := SubMenu2.Items[k];

                      for m := 0 to SubMenu4.Count - 1 do
                      begin
                         sNomeMenu := CaptaCaption(SubMenu4.Items[m].Caption);
                         sNomeItem := SubMenu4.Items[m].Name;

                         if (sNomeMenu = '') or (sNomeMenu = '-') then
                            continue;

                         qryMenu.Close;
                         qryMenu.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
                         qryMenu.ParamByName('NOMEFUNCAO').AsString := sNomeMenu;
                         qryMenu.Open;

                         if qryMenu.IsEmpty then
                         begin
                            bAlgumaInconsist := True;
                            with qryObjeto do
                            begin
                               Close;
                               ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
                               ParamByName('NOMEOBJETO').AsString := sNomeItem;
                               Open;
                               if not IsEmpty then
                                  sTemItem := 'S'
                               else
                                  sTemItem := 'N';
                            end;
                            memResult.Lines.Add(Copy(sNomeMenu + '                         ',1,25) +
                                                Copy(qryObjetoFUNCAOPAI.AsString + '                         ',1,25) +
                                                Copy(sNomeItem + '                         ', 1, 25) +
                                                '         ' + sTemItem);
                            GravaItem(sNomeMenu, sHist, sNomeItem, qryObjetoFUNCAOPAI.AsString, sTemItem);
                         end;
                      end; // for m
                   end; // if SubMenu[k]
                end; // for k
             end; // if SubMenu[j]
          end; // for j
     end; // for i
  end; // with

  if not bAlgumaInconsist then
  begin
     memResult.Lines.Add(' ');
     memResult.Lines.Add('            NENHUMA INCONSISTENCIA ENCONTRADA           ');
     memResult.Lines.Add(' ');
     memResult.Lines.Add(' ');
  end;

  // Continuar
  memResult.Lines.Add(' ');
  memResult.Lines.Add('2. Existe no Banco de Dados e NÃO existe no Sistema ');
  memResult.Lines.Add(' ');
  memResult.Lines.Add('Caption do Menu            Função Pai               Item de Menu                      Cadastrado');
  memResult.Lines.Add('----------------------------------- ------------------------------ ---------------------------------------- ----------------');

  sHist := 'Existe no Banco mas NÂO tem no Sistema';

  qryBanco.Close;
  qryBanco.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
  qryBanco.Open;

  qryBanco.First;
  while not qryBanco.Eof do
  begin
     sNomeBanco := qryBancoFUNCAO.AsString;

     bEncontrou := False;
     sTemItem := 'N';
     with frmPrincipal do
     begin
        for i := 0 to mnu.Items.Count - 1 do
        begin
           sNomeMenu := CaptaCaption(mnu.Items[i].Caption);

           if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu)) then
           begin
              bEncontrou := True;
              break;
           end;
           if qryBancoOBJETO.AsString = mnu.Items[i].Name then
              sTemItem := 'S';

           SubMenu   := mnu.Items[i];
           for j := 0 to SubMenu.Count - 1 do
           begin
              sNomeMenu := CaptaCaption(SubMenu.Items[j].Caption);

              if (sNomeMenu = '') or (sNomeMenu = '-') then
                 continue;

              if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu)) then
              begin
                 bEncontrou := True;
                 break;
              end;
              if qryBancoOBJETO.AsString = SubMenu.Items[j].Name then
                 sTemItem := 'S';

              // Verificar se SubMenu possui "filho", ou seja, outro submenu
              if SubMenu.Items[j].Count > 0 then
              begin
                 SubMenu2 := SubMenu.Items[j];

                 for k := 0 to SubMenu2.Count - 1 do
                 begin
                    sNomeMenu := CaptaCaption(SubMenu2.Items[k].Caption);

                    if (sNomeMenu = '') or (sNomeMenu = '-') then
                       continue;

                    if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu)) then
                    begin
                       bEncontrou := True;
                       break;
                    end;
                    if qryBancoOBJETO.AsString = SubMenu2.Items[k].Name then
                       sTemItem := 'S';

                    // Verificar se SubMenu possui "filho", ou seja, outro submenu
                    if SubMenu2.Items[k].Count > 0 then
                    begin
                       SubMenu3 := SubMenu2.Items[k];

                       for l := 0 to SubMenu3.Count - 1 do
                       begin
                          sNomeMenu := CaptaCaption(SubMenu3.Items[l].Caption);

                          if (sNomeMenu = '') or (sNomeMenu = '-') then
                             continue;

                          if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu)) then
                          begin
                             bEncontrou := True;
                             break;
                          end;
                          if qryBancoOBJETO.AsString = SubMenu3.Items[l].Name then
                             sTemItem := 'S';

                       end; // for l
                       if bEncontrou then break;
                    end; // if SubMenu2[k]
                 end; // for k
                 if bEncontrou then break;
              end; // if SubMenu[j]
           end; // for j
        end; // for i
     end; // with
     if not bEncontrou then
     begin
        bAlgumaInconsist := True;
        memResult.Lines.Add(Copy(sNomeBanco + '                         ',1,25) +
                            Copy(qryBancoFUNCAOPAI.AsString + '                         ',1,25) +
                            Copy(qryBancoOBJETO.AsString + '                         ', 1, 25) +
                            '         ' + sTemItem);
        GravaItem(sNomeBanco,sHist,qryBancoOBJETO.AsString,qryBancoFUNCAOPAI.AsString,sTemItem);
     end;
     qryBanco.Next;
  end;

  if not bAlgumaInconsist then
  begin
     memResult.Lines.Add(' ');
     memResult.Lines.Add('            NENHUMA INCONSISTENCIA ENCONTRADA           ');
     memResult.Lines.Add('Nenhuma inconsistência encontrada.');
  end;

  MsgDlg('Processo Terminado.','Informação',mtInformation,[mbOk],0);
end;

procedure TfrmVerificaMenuSAD.GravaItem(sCaption, sHist, sNomeItem, sItemPai, sTemItem: String);
begin
   qryRelatorio.Insert;
   qryRelatorioTIPO.AsString := sHist;
   qryRelatorioFUNCAOPAI.AsString := sItemPai;
   qryRelatorioNOMEFUNCAO.AsString := sCaption;
   qryRelatorioITEMMENU.AsString := sNomeItem;
   qryRelatorioTEMITEM.AsString := sTemItem;
   qryRelatorio.Post;
end;

function TfrmVerificaMenuSAD.CaptaCaption(sString: String): String;
var sTexto: String;
    eCom: Word;
begin
   sTexto := sString;
   // Se existe um e comercial na string - ex.: BM&F, pega a posição
   eCom := Pos('&&',sTexto);

   // Exclui todos os simbolos & da string
   while 1 = 1 do
   begin
      if Pos('&',sTexto) > 0 then
      begin
         // Se excluir um simbolo comocado antes do & diminui sua posição relativa
         if Pos('&',sTexto) < eCom then
            eCom := eCom -1;

         if Pos('&',sTexto) = 1 then
            Delete(sTexto,1,1)
         else
            Delete(sTexto,Pos('&',sTexto),1);
      end else Break;
   end;

   // Recoloca o & na string
   if eCom > 0 then
      Insert('&',sTexto,eCom);

   Result := sTexto;
end;

procedure TfrmVerificaMenuSAD.btImprimirClick(Sender: TObject);
begin
  inherited;
  rptRelatorio.Print;
end;

end.
